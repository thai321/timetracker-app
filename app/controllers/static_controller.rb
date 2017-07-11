class StaticController < ApplicationController
  def homepage
    if admin_types.include?(current_user.type)

      # @pending_approvals = Post.includes(:user).where(status: 'submitted')
      @pending_approvals = Post.includes(:user).submitted
      # @pending_approvals = Post.where(status: 'submitted')

      @recent_audit_items = AuditLog.includes(:user).last(10)
    else
      @pending_audit_confirmations = AuditLog.includes(:user).where(user: current_user).pending
    end
  end
end
