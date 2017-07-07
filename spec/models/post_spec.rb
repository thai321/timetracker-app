require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      user = User.create(email: "test@test.com",
                          first_name: "thai",
                          last_name: "nguyen",
                          password: "123456",
                          password_confirmation: "123456"
                          )
      login_as(user, :scope => :user)
      @post = Post.create(date: Date.today, rationale: "Anything", user: user)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a date and rationable' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end

  end
end
