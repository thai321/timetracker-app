class AuditLogPolicy < ApplicationPolicy
  def index?
    # Only Admin able to see the audit log tab
    return true if admin?
  end

  private

  def admin?
    admin_types.include?(user.type)
  end
end
