require 'bundler/setup'
Bundler.require(:default, :development)
require './model'

Mail.defaults do
  delivery_method :smtp, {:address => "localhost",
                          :port => 25,
                          :domain => 'localhost.com',
                          :enable_starttls_auto => false}
end

get '/mypage' do
  haml :index
end

post '/mypage/comments' do
  comment = Comment.create(:text => request['comment'])
  Mail.deliver do
    to 'shadows.bskyb@gmail.com'
    from 'noreply@localhost.com'
    subject 'you have had a comment'
    body "The comment was: #{comment.text}"
  end
  redirect '/mypage'
end

get '/styles.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end








