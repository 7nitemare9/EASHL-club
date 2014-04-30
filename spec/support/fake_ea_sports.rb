require 'sinatra/base'

class FakeEaSports < Sinatra::Base
  get '/nhl14proclubs/api/xbox/clubs/12345/matches' do
    json_response 200, 'matches.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :html
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

end