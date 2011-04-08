require 'rubygems'
require 'sinatra'
require 'email_sender'

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
    EmailSender.send(params)
    "message sent"
end