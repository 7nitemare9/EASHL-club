require 'rails_helper'

RSpec.describe "Streams", :type => :request do
  describe "GET /streams" do
    it "works! (now write some real specs)" do
      get streams_path
      expect(response.status).to be(200)
    end
  end
end
