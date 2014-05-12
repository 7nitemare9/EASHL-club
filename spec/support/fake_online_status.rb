require 'sinatra/base'

class FakeOnlineStatus < Sinatra::Base
  get 'https://live.xbox.com/sv-SE/Profile?Gamertag=Jonbacken' do
    json_response 200, 'online_status.html'
  end

  private

  def json_response(response_code, file_name)
    content_type :html
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

end
