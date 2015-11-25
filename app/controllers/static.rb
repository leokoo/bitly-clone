get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do
	# create a new url
	url = Url.create(long_url: params[:user_input_url])
	redirect "/"
end

# i.e. /q6bda
get '/:short_url' do
	url = Url.find_by(shortened_url: params[:short_url])
	# redirect to appropriate "long" URL
	unless url.nil?
		redirect url.long_url
	else
		redirect "/"
	end
end
