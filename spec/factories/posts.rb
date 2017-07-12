FactoryGirl.define do
  factory :post do
    date Date.today
    work_performed "Post"
    daily_hours 14.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    work_performed "Some more content"
    daily_hours 5.0
    user
  end

  factory :post_from_other_user, class: "Post" do
    date Date.today
    work_performed "post from other user content"
    daily_hours 4.5
    # user { FactoryGirl.create(:non_authorized_user) }
    user
  end

end
