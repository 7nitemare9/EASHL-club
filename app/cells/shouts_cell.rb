# SHoutbox cell
class ShoutsCell < Cell::Base
  def index
    @shouts = Shout.find_all
    render
  end

  def form
    @shout = Shout.new
    render
  end
end
