require 'pony'

class EmailSender
  def self.send(params)
     Pony.mail :to => params[:address],
            :from => 'greg.borenstein@gmail.com',
            :subject => params[:subject],
            :body => params[:body], 
            :via => :smtp,
            :via_options => { 
                :address   => 'smtp.sendgrid.net', 
                :port   => '25', 
                :user_name   => ENV['SENDGRID_USERNAME'], 
                :password   => ENV['SENDGRID_PASSWORD'],
                :authorization => :plain,
                :domain => ENV['SENDGRID_DOMAIN']
              } 
  end
end