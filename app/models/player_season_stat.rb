# Stores Player total club stats
class PlayerSeasonStat < ActiveRecord::Base
  belongs_to :player
  require 'web_helpers'

  def self.get_data(player_id)
    url = 'http://www.easports.com/iframe/nhl14proclubs/api/platforms/xbox/' \
    'members/' + player_id + '/stats'
    create_hash WebHelpers.read_json(url)
  end

  def self.create_hash(json_hash)
    data = json_hash['raw'][0]
    data_hasher(data) unless data.nil?
  end

  def self.data_hasher(data)
    do_not_touch = %w(id player_id created_at updated_at)
    hash = {}
    attribute_names.each do |attr|
      hash[attr.to_sym] = data[attr] unless do_not_touch.include?(attr)
    end
    hash
  end
end
