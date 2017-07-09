class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale

  # get the posts associate with the user
  scope :post_by, -> (user) { where(user_id: user.id) }
end
