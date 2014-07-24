# Saves player stat from game
class GamePlayer < ActiveRecord::Base
  belongs_to :match
end
