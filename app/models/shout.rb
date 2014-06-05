class Shout < ActiveRecord::Base
  
  validates :name, :message, :presence => true

  def self.find_all
    find(:all, :limit => 5, :order => 'id DESC')
  end

end
