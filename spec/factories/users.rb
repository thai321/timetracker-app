FactoryGirl.define do

  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    email { generate :email }
    first_name "thai"
    last_name "nguyen"
    password "123456"
    password_confirmation "123456"
  end

  factory :admin_user, class: "AdminUser" do
    email { generate :email }
    first_name "Admin"
    last_name "User"
    password "123456"
    password_confirmation "123456"
  end
end
