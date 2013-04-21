class Player < ActiveRecord::Base
require 'rubygems'
require 'nokogiri'
require 'open-uri'

	def self.getPage(page, team)
		url = "http://www.easportsworld.com/en_US/clubs/partial/402A0001/" + team + "/" +page
		doc = Nokogiri::HTML(open(url))					
		return doc		
	end
	def self.playerData(doc)
		member = {}
		list = []
		doc.css("tr").each do |player|
			unless player.at_css(".align-left div").blank? or player.at_css(".strong:nth-child(4)").blank? then
				member = {:name => player.at_css(".align-left div").text,
									:goals => player.at_css(".strong:nth-child(4)").text,
									:assists => player.at_css(".strong:nth-child(5)").text,
									:points => player.at_css(".strong:nth-child(6)").text,
									:hits => player.at_css(".strong:nth-child(11)").text }
				unless find_by_name(member[:name]) then
					create!(member)
					member[:status] = 'created'
				else
					db_player = find_by_name(member[:name])
					db_player.update_attributes(member)
					member[:status] = 'updated'
				end
				list.push(member)
			end		
		end
		return list		
	end
end
