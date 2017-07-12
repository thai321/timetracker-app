class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :work_performed, :daily_hours

  validates :daily_hours, numericality: { greater_than: 0.0 }

  # get the posts associate with the user
  # much faster and better query SQL
  scope :post_by, -> (current_user) { includes(:user).where(user_id: current_user.id) }

  after_save :confirm_audit_log, if: :submitted?
  after_save :un_confirm_audit_log, if: :rejected?

  private
  def confirm_audit_log # where returns an array --> call last
    audit_log = AuditLog.includes(:user).where(user_id: self.user_id,
                        start_date: (self.date - 7.days..self.date)).last
    audit_log.confirmed! if audit_log
  end

  def un_confirm_audit_log # where returns an array --> call last
    audit_log = AuditLog.includes(:user).where(user_id: self.user_id,
                        start_date: (self.date - 7.days..self.date)).last
    audit_log.pending! if audit_log
  end
end
