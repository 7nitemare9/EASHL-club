require 'sinatra/base'

class FakeEaSports < Sinatra::Base
  get '/iframe/nhl14proclubs/api/platforms/xbox/clubs/12345/matches' do
    json_response 200, 'matches.json'
  end
  get '/iframe/nhl14proclubs/api/platforms/xbox/clubs/12345/members/*/stats' do
    json_response 200, 'player_team_stats.json'
  end
  get '/iframe/nhl14proclubs/api/platforms/xbox/clubs/12345/members' do
    json_response 200, 'members.json'
  end
  get '/iframe/nhl14proclubs/api/platforms/xbox/members/12345/stats' do
    json_response 200, 'member_season.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :html
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

end
