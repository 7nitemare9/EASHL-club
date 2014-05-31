class Shout < ActiveRecord::Base

  def self.find_all
    find(:all, :limit => 5, :order => 'id DESC')
  end

end
