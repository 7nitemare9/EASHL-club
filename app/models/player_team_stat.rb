# Reads and stores player stats for in the current team
class PlayerTeamStat < ActiveRecord::Base
  belongs_to :player
  require 'web_helpers'

  def self.get_data(team_id, player_id)
    p "data"
    p team_id
    url = 'http://www.easports.com/iframe/nhl14proclubs/api/platforms/ps4/' \
          'clubs/' + team_id + '/members/' + player_id + '/stats?filters=pretty'
    p url
    create_hash(WebHelpers.read_json(url), player_id)
  end

  def self.create_hash(json_hash, id)
    p json_hash
    p json_hash['raw'][id]
    data = json_hash['raw'][id]
    hash(data) unless data.nil?
  end

  def self.hash(data)
    do_not_touch = %w(id player_id created_at updated_at)
    hash = {}
    attribute_names.each do |attr|
      hash[attr.to_sym] = data[attr] unless do_not_touch.include?(attr)
    end
    hash
  end
end
