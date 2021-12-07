# Posts Helper
module PostsHelper
  def comments?(post)
    return 'All comments' if post.comments.exists?

    'no comments'
  end
end
