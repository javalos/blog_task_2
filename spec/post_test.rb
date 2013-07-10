class PostTest < TestJavalos
  TEST_SOURCE = "<posts><post><content>Post 1</content></post></posts>"

  def test_initialize
    post = Post.new("")
    assert_not_null post
  end

  def test_post_source
    post = Post.new(TEST_SOURCE)
    assert_not_null post.source
    assert_equals TEST_SOURCE, post.source
  end

  def test_post_load
    
  end

end