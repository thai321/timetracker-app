@user = User.create(email: "test@test.com",
                    first_name: "thai",
                    last_name: "nguyen",
                    password: "123456",
                    password_confirmation: "123456"
                    )

puts "1 User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: @user)
end

puts "100 Posts have been created"


AdminUser.create(email: "admin@admin.com",
                    first_name: "admin",
                    last_name: "admin",
                    password: "123456",
                    password_confirmation: "123456"
                    )
