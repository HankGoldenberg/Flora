require 'sendgrid-ruby'
require 'sinatra'
include SendGrid

	


get '/' do 
	erb :index
end

get '/contact' do
	erb :contact
end

post '/email' do
	from = Email.new(email: "test@test.com" )
	to = Email.new(email: 'Hank.j.goldenberg@gmail.com')
	subject = params[:subject]
	content = Content.new(type: 'text/plain', value: "This is the content")
	mail = Mail.new(from, subject, to, content)

	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._('send').post(request_body: mail.to_json)
	puts response.status_code
	puts response.body
	puts response.headers

# redirect '/success'
end

get '/success' do
	erb :success
end
