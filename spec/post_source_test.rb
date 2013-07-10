class PostSourceTest < TestJavalos
  TEST_SOURCE = 
  "<posts>
    <post><content>Post 1</content></post>
    <post><content>Post 2</content></post>
    <post><content>Post 3</content></post>
  </posts>"

  def test_initialize
    post_source = PostSource.new("")
    assert_not_null post_source.source
    assert_not_null post_source
  end

  def test_post_source
    post_source = PostSource.new(TEST_SOURCE)
    assert_equals TEST_SOURCE, post_source.source
  end

  def test_post_all
    post_source = PostSource.new(TEST_SOURCE)
    posts = post_source.all
    assert_not_null posts
    assert_equals 3, posts.length
    posts.each_char { |post| assert_equals true, post.instance_of? Post  }
  end

end