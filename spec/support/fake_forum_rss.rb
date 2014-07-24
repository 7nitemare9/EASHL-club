require 'sinatra/base'

# Fakes Rss feed from forum
class FakeForumRss < Sinatra::Base
  get '/forum/syndication.php' do
    json_response 200, 'rss.txt'
  end

  private

  def json_response(response_code, file_name)
    content_type :html
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
