class Server

  def initialize(config)
    @config = config
  end

  def start
    init_server
    routes
    @server.start
  end

  def init_server
    @server = WEBrick::HTTPServer.new(
      :Port => @config.port, 
      :DocumentRoot => './public',
      :Logger => @config.logger,
      :AccessLog => @config.access_log
      )
    trap("INT"){ @server.shutdown }
  end

  def routes
    @server.mount "/posts", PostController, @config
  end

  def shutdown
    @config.finalize
    @server.shutdown
  end
end