require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end
  end

  describe "User#Phone validation" do
    it 'requires the phone attr to only contain integers' do
      @user.phone = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only have 10 chars' do
      @user.phone = '12345678901'
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it 'has a full name method that combines first and last name' do
      expect(@user.full_name).to eq("NGUYEN, THAI")
    end
  end

  describe 'relationship between admins and employees' do
    it 'allows for admins to be associated with multiple employees (managers)' do
      employee_1 = FactoryGirl.create(:user)
      employee_2 = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin_user)
      Hand.create!(user: admin, hand: employee_1)
      Hand.create!(user: admin, hand: employee_2)
      expect(admin.hands.count).to eq(2)
    end
  end

end
