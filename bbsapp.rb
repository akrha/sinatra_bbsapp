require 'sinatra'
require 'sinatra/reloader'

require 'mysql2'
require 'active_record'
require 'erb'

ActiveRecord::Base.configurations = YAML.load_file("database.yml")
ActiveRecord::Base.establish_connection(:development)

class Topic < ActiveRecord::Base
end
class Comment < ActiveRecord::Base
end

get '/' do
	@title = "BBS"
	@topics = Topic.all
	erb :index
end

post '/topic_create' do
	Topic.create(
		title: params[:title],
		body: params[:body]
	)
	redirect '/'
end

get '/topic/:id' do
	@topic = Topic.find(params[:id])
    @title = @topic["title"]
	@comments = Comment.where(topic_id: params[:id])
	erb :topic
end

post '/comment_create' do
	Comment.create(
		topic_id: params[:topic_id],
		body: params[:body]
	)
	redirect "/topic/#{params[:topic_id]}"
end