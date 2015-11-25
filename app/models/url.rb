class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url,
		:uniqueness => true,
		:presence => true,
		:format => { :with => /http(s)*:\D\D\w+(.)\w+(.\D)*/}

	validates :shortened_url,
		:uniqueness => true

	before_create :shorten
	def shorten
		# write a method here
		self.shortened_url = SecureRandom.hex(4)
	end
end

#use a before_create call back in the URL model to generate the short URL