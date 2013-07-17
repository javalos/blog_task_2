class PostTest < TestJavalos
  def test_post_initialize
    post = Post.new
    assert_not_null post
  end

  def test_post
    title = "Post title"
    content = "Post content"
    post = Post.new({id: 1, content: content, title: title})
    assert_equals content, post.content
    assert_equals title, post.title
    assert_equals 1, post.id
  end

end