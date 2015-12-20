require 'sinatra'
require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "postgresql",
  "user" => "dlrdaiafqmvrnf",
  "password" => "pHhw6IwH5XZVQFJXEVNxveKq0L",
  "host" => "ec2-54-83-204-159.compute-1.amazonaws.com",
  "port" => "5432",
  "database" => "dap4s96ff85r1i"
)

class Post < ActiveRecord::Base
end

get '/' do
  @contents = Post.where(parent: "999").order(id: "desc")
  @res = Post.where.not(parent: "999").order(id: "desc")
  erb :index
end

post '/newPost' do
  if params[:name] != "" && params[:title] != "" && params[:message] != "" then
    Post.create({
      :name => params[:name],
      :title => params[:title],
      :message => params[:message],
      :parent => params[:parent]
    })
    redirect '/'
  else
  "Error-空の項目があります。<br><a href=\"/\">トップに戻る</a>"
  end
end
