require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:post) {
    #use let! to force the method's invocation before each example
    FactoryGirl.create(:post, user: user)
    # Post.create(date: Date.today, rationale: "Rationable", user_id: user.id)
  }

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/Post|content/)
    end

    it 'has a scope so that only post creators can see their posts' do
      other_user = FactoryGirl.create(:other_user)
      post_from_other_user = FactoryGirl.create(:post,
      rationale: "This post shouldn't be seen" , user: other_user,
      overtime_request: 3.5)

      visit posts_path

      expect(page).to_not have_content(/This post shouldn't be seen/)
    end

  end

  describe 'New' do
    it 'has a link from the homepage' do
      employee = Employee.create(email: "employee@example.com",
      first_name: "employee", last_name: "employee",
      password: "1233456", password_confirmation: "123456",
      phone: "5555555555")
      login_as(employee, :scope => :user)

      visit root_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      visit posts_path

      click_link("delete_post_#{post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end


  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reach' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      fill_in 'post[overtime_request]', with: 4.5
      # click_on "Save"

      # expect(page).to have_content("Some rationale")
      expect { click_on "Save" }.to change(Post, :count).by(1)
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      fill_in 'post[overtime_request]', with: 4.5
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end

  describe 'Edit' do

    # Base case, this is pass, but we don't need it
    it '[Base case] can be reached by clicking edit on index page' do
      visit posts_path
      click_link("edit_#{post.id}") # looking for an id
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non-authorized user' do
      logout(:user)

      non_authorized_user = FactoryGirl.create(:other_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end

end
