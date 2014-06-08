require 'sinatra/base'

# Fakes Onlinestatus respons from xbox-live
class FakeOfflineStatus < Sinatra::Base
  get '/sv-SE/Profile' do
    gamertag = params[:Gamertag]
    if gamertag == 'iZHiTNiK'
      json_response 200, 'offline_status.html'
    else
      json_response 200, 'online_status.html'
    end
  end

  private

  def json_response(response_code, file_name)
    content_type :html
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
