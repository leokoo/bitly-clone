class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |t|
			t.string :long_url
			t.string :shortened_url
			t.timestamps null: false
		end
	end
end
