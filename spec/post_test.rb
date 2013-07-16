class PostTest < TestJavalos
  def test_post_initialize
    post = Post.new
    assert_not_null post
  end

  def test_post
    title = "Post title"
    content = "Post content"
    post = Post.new(title, content)
    assert_equals content, post.content
    assert_equals title, post.title
    assert_equals true, post.id > 0
  end

end