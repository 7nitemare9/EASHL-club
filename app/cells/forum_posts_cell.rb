# Latest forum threads
class ForumPostsCell < Cell::Rails
  def recent
    @posts = ForumPost.topics
    render
  end

  def not_logged_in
    item = { link: "#", title: "Not signed in", dc_creator: "" }
    temp = { items: [OpenStruct.new(item)] }
    @posts = OpenStruct.new temp
    render view: :recent
  end
end
