class WebHelpers
  require 'nokogiri'
  require 'open-uri'
  require 'json'

  def self.read_url(url)
    begin
      Nokogiri::HTML(open(url))
		rescue => e
		  puts e.message
		end
  end

  def self.parse_ea_json(doc)
    JSON.parse(doc.css("p").text)
  end

end
