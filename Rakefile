require 'email_sender'

desc "This task is called by the Heroku cron add-on"
task :cron do
  EmailSender.send(:address => "greg.borenstein@gmail.com", :subject => "from cron", :body => Time.now.to_s)
  end
end