class Player < ActiveRecord::Base
require 'rubygems'
require 'nokogiri'
require 'open-uri'

	def self.getPage(page, team)
		url = "http://www.easportsworld.com/en_US/clubs/partial/402A0001/" + team + "/" +page
		begin
			doc = Nokogiri::HTML(open(url))
		rescue => e
		  puts e.message
		end					
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

	def self.online
		list = []
		member = {}
		db_players = find(:all)
	 	db_players.each do |db_player|
			member = {}
			url = 'https://live.xbox.com/sv-SE/Profile?Gamertag=' + CGI.escape(db_player[:name])
			begin
				doc = Nokogiri::HTML(open(url))
			rescue => e
		  	next
			end
			status = doc.at_css(".presence").text			
			if status.include? 'offline' or status.include? 'senast' then
				member[:name] = db_player[:name]
				member[:status] = 'Offline'
				member[:text] = status
			else
				member[:name] = db_player[:name]
				member[:status] = 'Online'
				member[:text] = status
			end
			if Rails.application.assets.find_asset("Xbox/" + db_player[:name] + "_Online.jpg").nil? then
				member[:image] = '/assets/Xbox/empty.jpg'
				member[:text] = db_player[:name] + ': ' + status
			else
				member[:image] = "assets/Xbox/" + db_player[:name] + "_" + member[:status] + ".jpg"
			end
			list.push(member)
		end
		return list
	end
end
