@employee = Employee.create(email: "test@test.com",
                    first_name: "thai",
                    last_name: "nguyen",
                    password: "123456",
                    password_confirmation: "123456",
                    phone: "4086085237",
                    ssn: 1234,
                    company: "XYZ Company"
                    )

puts "1 employee created"

AdminUser.create(email: "admin@admin.com",
                    first_name: "admin",
                    last_name: "admin",
                    password: "123456",
                    password_confirmation: "123456",
                    phone: "4086085237",
                    ssn: 1234,
                    company: "XYZ Company"
                    )
puts "1 admin created"


AuditLog.create!(user: @employee, status: 0, start_date: (Date.today - 6.days))

AuditLog.create!(user: @employee, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user: @employee, status: 0, start_date: (Date.today - 20.days))
puts "3 auditlogs have been created"

100.times do |post|
  Post.create!(date: Date.today,
  work_performed: "#{post} work_performed content is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  user: @employee, daily_hours: 17.5)
end

puts "100 Posts have been created"
