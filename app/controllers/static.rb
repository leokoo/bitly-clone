require 'byebug'

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
	@url = Url.find_by(shortened_url: params[:short_url])
	# byebug
	# increase counter
	# i = Url.find_by(counter: params[:short_url])
	# @url.counter +=1
	# byebug
	# i += 1
	# redirect to appropriate "long" URL
	unless @url.nil? # if not nil
		@url.counter +=1
		@url.save
		redirect @url.long_url	
	else
		redirect "/"
	end
end
