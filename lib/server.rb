include WEBrick

class Server

  def initialize port=2000, source="posts.xml"
    @port = port
    @source = source
  end

  def start
    post_source = PostSource.new(File.new(@source))

    @server = HTTPServer.new(:Port=>2000, :DocumentRoot=>'./public')
    @server.mount "/posts", PostController, post_source
    trap("INT"){ @server.shutdown }
    @server.start
  end

  def shutdown
    @server.shutdown
  end

end