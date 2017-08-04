require 'sinatra'

get '/' do 
	erb :index
end

get '/contact' do
	erb :contact
end

post '/email' do
	"Title is #{params[:title]}, and message is: #{params[:message]}"
end