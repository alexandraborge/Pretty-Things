require 'sinatra'

get '/' do
  erb :home
end

get '/new' do
  erb :new_post
end

post '/' do
  #create a new html file for each form submitted and send the info submitted in the params to the home page
end
