class ProductionConfig
  
  SOURCE_NAME = "posts.xml"
  attr_reader :source, :port

  def initialize
    @port = 2000
    @source = PostSource.new(File.new(SOURCE_NAME))
  end

  def logger
    @logger = WEBrick::Log.new("log/prod.log") if @logger.nil?
    @logger
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