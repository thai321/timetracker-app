#Very simple logic in here
namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime or not"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      site = 'https://thai-overtime.herokuapp.com'
      notification_message = "Please log into the overtime management dashboard to request overtime or confirm your hours for last week: #{site}"
      employees.each do |employee|
        SmsTool.send_sms(number: employee.phone, message: notification_message)
      end
    end
  end
    # 1. Schedule to run at Sunday at 5PM
    # 2. Iterate over all employees
    # 3. Skip AdminUsers
    # 4. Send a message that has intructions add a link to log time


  desc "Sends mail notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    # 1. Iterate over the list of pending overtime requests
    # 2. Check to see if there are any requests
    # 3. Send the email to each admin
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
