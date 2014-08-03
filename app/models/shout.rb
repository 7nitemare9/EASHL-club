# Shoutbox model
class Shout < ActiveRecord::Base
  validates :name, :message, presence: true

  def self.find_all
    find(:all, order: 'id DESC')
  end
end
