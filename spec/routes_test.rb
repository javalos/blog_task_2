require 'net/http'

class RoutesTest < TestJavalos

  def test_get_root
    result = get "/"
    assert_equals 200, result.code
  end

  private

  def get path
    Net::HTTP.get_response('localhost', path, 2000)
  end
end