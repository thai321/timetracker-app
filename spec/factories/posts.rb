FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Post"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some more content"
    user
  end

  factory :post_from_other_user, class: "Post" do
    date Date.today
    rationale "post from other user content"
    # user { FactoryGirl.create(:non_authorized_user) }
    user
  end

end
