class PostPolicy < ApplicationPolicy
  def update?
    # Case 1 = User of record , Case 2 = Admin User
    (record.user_id == user.id) || admin_types.include?(user.type)
    # user here is the current user
  end
end
