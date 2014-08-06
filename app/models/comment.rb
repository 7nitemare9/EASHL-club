# Comments for news posts
class Comment < ActiveRecord::Base
  belongs_to :post
end
