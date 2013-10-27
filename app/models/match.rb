class Match < ActiveRecord::Base
require 'nokogiri'
require 'open-uri'

	def self.getPage(page, team)
		url = "http://www.easportsworld.com/en_US/clubs/partial/NHL14XBX/" + team + "/" +page
		begin		
			doc = Nokogiri::HTML(open(url))					
		rescue => e
		  puts e.message
		end
		return doc		
	end

	def self.pos(num)
		case num.to_i
		when 0
			return 'Goalie'
		when 1
			return 'Def'
		when 3
			return 'LW'
		when 4
			return 'Center'
		when 5
			return 'RW'
		end
	end

	def self.matchData(doc, team)
		list = []
		game = {}
		doc.css(".simple-results-table").each do |match|
			defender = 1
			game = {:opponent => match.at_css(".align-right").text,
							:gScored => match.at_css(".match-result-score").text[/^\d/],
							:gLetIn => match.at_css(".match-result-score").text[/\d$/],
							:rel => match.at_css(".match-details-button")['rel']}
			unless find_by_rel(game[:rel]) then
				players = getPage('match-results/details?match_id=' + game[:rel] + '&type=all', team)
				players.css(".first tbody tr").each do |player|
					name = player.at_css(".text-overflow a").text
					pos  = pos(player.at_css("td:nth-child(2)").text)
					if pos.eql? 'Def' then
						pos = pos + defender.to_s
						defender += 1
					end				
					game[pos.to_sym] = name
					unless pos.eql? 'Goalie' then
						game[('p' + pos).to_sym] = player.at_css("td:nth-child(3)").text
						game[('h' + pos).to_sym] = player.at_css("td:nth-child(4)").text
					end
				end
				create!(game)
				list.push(game)			
			end						
		end
		return list
	end

end
