require 'sinatra'

get '/' do
  erb :home
end

get '/new' do
  erb :new_post
end

get '/submitted' do
  erb :submit
end

post '/' do
  title = params[:title]
  body = params[:body]

  # creates new html file for each time the post gets submitted
  File.open("public/blog_posts/" + title + ".html", "w")  do |f|

    #write the title and body submitted to that file
    f.write(title)
    f.write(body)
  end
  # post title links to the homepage "/"

  #shows you to '/submitted' page
  erb :submit

end

get "/:title" do
  #joins the file paths together and stores it into a variable
  post_file = File.join("public", "blog_posts", "#{params[:title]}.html")
  #takes the data in that file path above and shows it when user is in the URL path above "/:title"
  send_file(post_file)
end
