require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @audit_log = FactoryGirl.create(:audit_log)
  end

  describe 'Creation' do
    it 'can be properly created' do
      expect(@audit_log).to be_valid
    end

    it 'should be required to have a user association' do
      @audit_log.user = nil
      expect(@audit_log).to_not be_valid
    end

    it 'it should always have a status' do
      @audit_log.status = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should be required to have a start_date' do
      @audit_log.start_date = nil
      expect(@audit_log).to_not be_valid
    end

    it 'it should have a start date equal to 6 days prior' do
      new_audit_log = AuditLog.create(user: User.last, status: 0)

      expect(new_audit_log.start_date).to eq(Date.today - 6.days)
    end
  end
end


# t.bigint "user_id"
# t.integer "status", default: 0
# t.date "start_date"
# t.date "end_date"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
