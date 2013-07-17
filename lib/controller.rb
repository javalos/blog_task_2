class Controller < WEBrick::HTTPServlet::AbstractServlet
  attr_reader :request, :response, :method, :params, :source

  def initialize(server, config)
    super(server)
    @source = config.source
  end

  def do_GET(request, response)
    resolve_call(request, response)
  end

  def do_POST(request, response)
    resolve_call(request, response)
  end

  def resolve_call(request, response)
    @request = request
    @response = response
    @params = request.query

    parse_path_from_request
    body = self.send(@method)

    response.status = 200
    response['Content-Type'] = "text/html"
    response.body = body
  end

  def parse_path_from_request
    paths = request.path.scan(/\/(\w+)/)
    page_not_found if paths.empty?
    paths = paths.map { |path|  path.first  }
    if paths.count == 1
      @method = "index"
    elsif paths.count == 2 and is_integer?(paths[1])
      @params["id"] = paths[1]
      @method = "show"
    elsif paths.count == 2 and self.respond_to?(paths[1])
      @method = paths[1]
    else
      page_not_found
    end
  end

  def post?
    request.request_method == "POST"
  end

  def page_not_found
    raise WEBrick::HTTPStatus::NotFound
  end

  def redirect_to url
    response.set_redirect(WEBrick::HTTPStatus::MovedPermanently, url)
  end

  def html_with body
    "<html>
      <body><div>#{body}</div></body>
    </html>"
  end

  def is_integer? value
    /^(\d+)$/ =~ value
  end
end