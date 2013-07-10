class PostTest < TestJavalos
  test_source = "<posts><post><content>Post 1</content></post></posts>"

  def test_initialize
    post = Post.new("")
    assert_not_null post
  end

  def test_post_source
    post = Post.new(test_source)
    assert_not_null post.source
    assert_equals test_source, post.source
  end

  def test_post_load
    
  end

end