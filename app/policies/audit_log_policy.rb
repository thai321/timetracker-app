class AuditLogPolicy < ApplicationPolicy
  def index?
    # Only Admin able to see the audit log tab
    return true if admin?
  end

  def confirm?
    record.user_id == user.id
  end
  private

  def admin?
    admin_types.include?(user.type)
  end
end
