# Handles news-posts and prepares them for custom news display
class Post < ActiveRecord::Base
  require 'nokogiri'

  def self.news
    news = []
    last(5).reverse.each do |post|
      news.push split_image_and_text(post)
    end
    news
  end

  def self.split_image_and_text(post)
    {
      title: post.title,
      image: extract_images(post),
      text: extract_text(post, extract_images(post)),
      id: post.id
    }
  end

  def self.extract_images(post)
    Nokogiri::HTML(post.text).css('img').map { |i| i['src'] }
  end

  def self.extract_text(post, images)
    text = ''
    if images[0]
      text = Nokogiri::HTML(post.text)
      text.at_xpath("//img[@src='#{images[0]}']").remove
    else
      text = post.text
    end
    text
  end
end
