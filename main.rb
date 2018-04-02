require 'sinatra'

get '/' do
  erb :home
end

get '/new' do
  erb :new_post
end

post '/' do
  title = params[:title]
  body = params[:body]
#creates new html file for each time the post gets submitted
  File.open("public/blog_posts/" + title + ".html", "w")  do |f|
#write the title and body submitted to that file
    f.write(title)
    f.write(body)
  end
  erb :home
  #post title links to the homepage "/"
end

get '/:title' do
  blog_post = File.join(".", "public", "blog_posts", "#{params[:title]}.html")

  send_file(blog_post)
end
