class PostController < WEBrick::HTTPServlet::AbstractServlet
  
  def initialize(server, post_source)
    super(server)
    @post_source = post_source
  end

  def do_GET(request, response)
    status, content_type, body = get_posts

    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  def do_POST(request, response)
    create_post(request)
    do_GET(request, response)
  end

  def get_posts
    posts = @post_source.all
    html = "<html><body><div><h1>Posts:</h1>"
    posts.each do |post|
      html = html + "<p>#{post.content}</p>"
    end
    form = "<form action='/posts' method='post'>
            Post: <input type='text' name='content'>
            <input type='submit' value='Create'>
            </form>"
    html = html + form + "</div></body></html>"
    return 200, "text/html", html
  end

  def create_post request
    post = Post.new request.query["content"]
    @post_source.add post
  end
end