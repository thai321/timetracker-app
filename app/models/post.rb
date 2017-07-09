class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale

  # get the posts associate with the user
  # much faster and better query SQL
  scope :post_by, -> (current_user) { includes(:user).where(user: current_user) }
end
