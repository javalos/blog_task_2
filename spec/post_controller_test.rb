require 'net/http'

class PostControllerTest < TestJavalos

  def test_get_root
    result = get "/"
    assert_equals "200", result.code
  end

  def test_get_posts
    result = get "/posts"
    assert_equals "200", result.code
  end

  def test_post_posts
    result = post "/posts"
    assert_equals "200", result.code
  end

  private

  def get path
    Net::HTTP.get_response('localhost', path, TestConfig.port)
  end

  def post path
    http = Net::HTTP.new('localhost', TestConfig.port)
    http.post(path, "")
  end
end