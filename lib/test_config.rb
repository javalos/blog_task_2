class TestConfig

  SOURCE_NAME = "posts_test.xml"
  attr_reader :source, :port, :logger

  def initialize
    create_test_file
    @port = TestConfig.port
    @source = PostSource.new(SOURCE_NAME)
    @logger = WEBrick::Log.new("log/test.log")
  end

  def self.port
    2001
  end

  def access_log
    [
      [logger, WEBrick::AccessLog::COMMON_LOG_FORMAT],
      [logger, WEBrick::AccessLog::REFERER_LOG_FORMAT],
    ]   
  end

  def finalize
    delete_test_file
  end

  private

  def create_test_file
    content = "<posts next_id='1'></posts>"
    test_file = File.new(SOURCE_NAME, "w")
    test_file.write(content)
    test_file.close
  end

  def delete_test_file
    FileUtils.rm(SOURCE_NAME)
  end
end