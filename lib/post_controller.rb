class PostController < WEBrick::HTTPServlet::AbstractServlet
  TEST_SOURCE = 
  "<posts>
    <post><content>Post 1</content></post>
    <post><content>Post 2</content></post>
    <post><content>Post 3</content></post>
  </posts>"

  def do_GET(request, response)
    status, content_type, body = get_posts

    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  def do_POST(request, response)
    status, content_type, body = create_post(request)

    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  def get_posts
    post_source = PostSource.new(TEST_SOURCE)
    posts = post_source.all
    html = "<html><body><div><h1>Posts:</h1>"
    posts.each do |post|
      html = html + "<p>#{post.content}</p>"
    end
    html = html + "</div></body></html>"
    return 200, "text/html", html
  end

  def create_post request
    return 200, "text/html", "html"
  end
end