require 'sinatra'

get '/' do
  erb :home
end

get '/new' do
  erb :new_post
end
