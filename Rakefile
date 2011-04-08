require 'email_sender'

desc "This task is called by the Heroku cron add-on"
task :cron do
  EmailSender.send(:from => "greg.borenstein@gmail.com" , :to => "greg.borenstein@gmail.com", :subject => "from cron", :body => Time.now.to_s)
  end
end