# Latest forum threads
class ForumPostsCell < Cell::Rails
  def recent
    @posts = ForumPost.topics
    render
  end
end
