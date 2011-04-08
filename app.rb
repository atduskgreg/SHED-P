require 'rubygems'
require 'sinatra'
require 'pony'

get "/" do
  <<-HTML
    <form action="/send" method="POST">
      <p><label>To</label> <input type="text" name="address" /></p>
      <p><label>Subject</label> <input type="text" name="subject" /></p>

      <p><label>Body</label><br /> <textarea cols="40" rows="20" name="body"></textarea></p>

      <p><input type="submit" value="s"></p>
    </form>
  HTML
end

post "/send" do
  Pony.mail :to => params[:address],
            :from => 'greg.borenstein@gmail.com',
            :subject => params[:subject],
            :body => params[:body], 
            
            :via_options => => { 
                :address   => 'smtp.sendgrid.net', 
                :port   => '25', 
                :user_name   => ENV['SENDGRID_USERNAME'], 
                :pass   => ENV['SENDGRID_PASSWORD']
                :domain => ENV['SENDGRID_DOMAIN']
              } 

    
    "message sent"
end