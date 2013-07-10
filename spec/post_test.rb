class PostTest < TestJavalos
  def test_initialize
    post = Post.new("")
    assert_not_null post
  end

  def test_post_source
    source = "<posts><post>Post 1<post><posts>"
    post = Post.new(source)
    assert_not_null post.source
    assert_equals source, post.source
  end

end