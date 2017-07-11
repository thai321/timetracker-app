@user = User.create(email: "test@test.com",
                    first_name: "thai",
                    last_name: "nguyen",
                    password: "123456",
                    password_confirmation: "123456",
                    phone: "4086085237"
                    )

puts "1 User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: @user, overtime_request: 2.5)
end

puts "100 Posts have been created"


AdminUser.create(email: "admin@admin.com",
                    first_name: "admin",
                    last_name: "admin",
                    password: "123456",
                    password_confirmation: "123456",
                    phone: "4086085237"
                    )


100.times do
  AuditLog.create!(user: User.last, status: 0, start_date: (Date.today - 6.days))
end
puts "100 auditlogs have been created"
