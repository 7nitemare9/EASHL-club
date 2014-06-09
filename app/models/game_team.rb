# Model for storing team data from game
class GameTeam < ActiveRecord::Base
  belongs_to :match
end
