require 'net/http'

class PostControllerTest < TestJavalos

  def test_get_root
    result = get "/"
    j_assert_equals "200", result.code
  end

  def test_get_index
    result = get "/posts"
    j_assert_equals "200", result.code
  end

  def test_get_new
    result = get "/posts/new"
    j_assert_equals "200", result.code
  end

  def test_get_show
    result = get "/posts/show"
    j_assert_equals "200", result.code
  end

  def test_post_create
    result = post "/posts/create"
    j_assert_equals "301", result.code
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