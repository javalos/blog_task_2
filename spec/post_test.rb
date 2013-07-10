class PostTest < TestJavalos
  def test_initialize
    post = Post.new(source: "")
    assert_not_null post
    assert_not_null post.source
  end

end