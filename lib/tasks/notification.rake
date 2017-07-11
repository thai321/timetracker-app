#Very simple logic in here
namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime or not"
  task sms: :environment do
    puts "I'm in a rake task"
    # 1. Schedule to run at Sunday at 5PM
    # 2. Iterate over all employees
    # 3. Skip AdminUsers
    # 4. Send a message that has intructions add a link to log time

    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end
end
