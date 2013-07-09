class PostTest < TestJavalos
  def test_initialize
    post = Post.new
    assert_not_null post
  end
end