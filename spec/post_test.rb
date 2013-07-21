class PostTest < TestJavalos
  def test_post_initialize
    post = Post.new
    j_assert_not_null post
  end

  def test_post
    title = "Post title"
    content = "Post content"
    post = Post.new({id: 1, content: content, title: title})
    j_assert_equals content, post.content
    j_assert_equals title, post.title
    j_assert_equals 1, post.id
  end

end