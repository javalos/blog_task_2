class PostTest < TestJavalos
  def test_post_initialize
    post = Post.new
    assert_not_null post
  end

  def test_post_content
    post_content = "Post content"
    post = Post.new(post_content)
    assert_equals post_content, post.content
  end

end