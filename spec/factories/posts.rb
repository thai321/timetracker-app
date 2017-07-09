FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Post"
    overtime_request 3.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some more content"
    overtime_request 0.5
    user
  end

  factory :post_from_other_user, class: "Post" do
    date Date.today
    rationale "post from other user content"
    overtime_request 4.5
    # user { FactoryGirl.create(:non_authorized_user) }
    user
  end

end
