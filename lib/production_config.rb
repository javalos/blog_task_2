class ProductionConfig

  SOURCE_NAME = "posts.xml"
  attr_reader :source, :port, :logger

  def initialize
    @port = 2000
    @source = PostSource.new(SOURCE_NAME)
    @logger = WEBrick::Log.new("log/prod.log")
  end

  def access_log
    [
      [logger, WEBrick::AccessLog::COMMON_LOG_FORMAT],
      [logger, WEBrick::AccessLog::REFERER_LOG_FORMAT],
    ]   
  end

  def finalize
  end
end