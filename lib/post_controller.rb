class PostController < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    status, content_type, body = get_posts(request)

    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  def get_posts(request)
    html   = "<html><body>Posts:</body></html>"
    return 200, "text/html", html
  end
end