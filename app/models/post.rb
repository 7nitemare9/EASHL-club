class Post < ActiveRecord::Base

  require 'nokogiri'

  def self.get_news
    news = []
    posts = all.reverse.each do |post|
      news.push split_image_and_text(post)
    end
    news
  end

  def self.split_image_and_text(post)
    news = {}
    news[:title] = post.title
    news[:image] = Nokogiri::HTML(post.text).css('img').map { |i| i['src'] }
    if news[:image][0]
      news[:text] = Nokogiri::HTML(post.text)
      news[:text].at_xpath("//img[@src='#{news[:image][0]}']").remove
      p news[:text]
    else
      news[:text] = post.text
    end
    news[:id] = post.id
    news
  end

end
