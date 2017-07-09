require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Hello from Posts Index/)
    end

    it 'has a list of posts' do
      # post1 = Post.create(date: Date.today, rationale: "Post1", user: @user)
      # post1 = FactoryGirl.create(:post)
      post1 = FactoryGirl.build_stubbed(:post, user: @user)
      post2 = FactoryGirl.create(:second_post, user: @user)
      visit posts_path
      expect(page).to have_content(/Post1|content/)
    end

    it 'has a scope so that only post creators can see their posts' do
      post1 = FactoryGirl.build_stubbed(:post, user: @user)
      post2 = FactoryGirl.build_stubbed(:second_post, user_id: @user.id)

      other_user = FactoryGirl.create(:other_user)
      post_from_other_user = FactoryGirl.create(:post,
      rationale: "This post shouldn't be seen" , user: other_user)

      visit posts_path

      expect(page).to_not have_content(/This post shouldn't be seen/)
    end

  end

  describe 'New' do
    it 'has a link from the homepage' do
      visit root_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @post = FactoryGirl.create(:post, user: @user)
      visit posts_path

      click_link("delete_post_#{@post.id}_from_index")
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
      click_on "Save"

      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end

  describe 'Edit' do
    before do
      @post = FactoryGirl.create(:post, user_id: @user.id)
    end

    # Base case, this is pass, but we don't need it
    it '[Base case] can be reached by clicking edit on index page' do
      visit posts_path
      click_link("edit_#{@post.id}") # looking for an id
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non-authorized user' do
      logout(:user)

      non_authorized_user = FactoryGirl.create(:other_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end

end
