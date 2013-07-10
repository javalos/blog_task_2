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
    posts.each { |post| assert_equals true, post.instance_of?(Post)  }
    assert_equals "Post 1", posts[0].content
    assert_equals "Post 2", posts[1].content
    assert_equals "Post 3", posts[2].content
  end

end