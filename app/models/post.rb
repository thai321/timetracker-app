class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale, :overtime_request

  validates :overtime_request, numericality: { greater_than: 0.0 }

  # get the posts associate with the user
  # much faster and better query SQL
  scope :post_by, -> (current_user) { includes(:user).where(user_id: current_user.id) }

  after_save :update_audit_log

  private
  def update_audit_log # where returns an array --> call last
    audit_log = AuditLog.includes(:user).where(user_id: self.user_id,
                        start_date: (self.date - 7.days..self.date)).last
    audit_log.confirmed!
  end
end
