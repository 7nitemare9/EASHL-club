class ShoutsCell < Cell::Rack

  def index
    @shouts = Shout.find_all
    render
  end

  def form
    @shout = Shout.new
    render
  end
end
