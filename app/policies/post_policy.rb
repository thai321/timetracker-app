class PostPolicy < ApplicationPolicy

  def approve?
    admin?
  end

  def update?
    #allow admin
    return true if post_approved? && admin?
    return true if user_or_admin && !post_approved?
    # allow user to update if it's their post and post is not approved
    # alow admin to update

    # Case 1 = User of record , Case 2 = Admin User
    # (record.user_id == user.id) || admin_types.include?(user.type)
    # user here is the current user
  end

  private

  def user_or_admin
    record.user_id == user.id || admin?
  end

  def admin?
    admin_types.include?(user.type)
  end

  def post_approved?
    record.approved?
  end
end
