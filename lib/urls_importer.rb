require_relative '../config/environments/init'
# require_relative '../app/models/url'


  def import(filename=File.dirname(__FILE__) + "/../db/data/urls")
    File.open(filename).each do |line|
      data = line.gsub(/http(s)*:\D\D\w+(.)\w+(.\w+)*/).each_with_index do |sample_urls, index|
        Url.transaction do
          generated_short_url = SecureRandom.hex(4)
          Url.connection.execute "INSERT INTO urls (long_url, shortened_url,created_at, updated_at) VALUES ('#{sample_urls}', '#{generated_short_url}','#{Time.now}', '#{Time.now}');"
        end
      end
     end
  end

import