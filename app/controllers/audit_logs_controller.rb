class AuditLogsController < ApplicationController

  def index
    @audit_logs = AuditLog.includes(:user)
    authorize @audit_logs # only admin able to access this index page
  end

end
