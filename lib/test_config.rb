class TestConfig
  
  SOURCE_NAME = "posts_test.xml"
  attr_reader :source, :port

  def initialize
    create_test_file
    @port = 2001
    @source = PostSource.new(File.new(SOURCE_NAME))
  end

  def logger
    WEBrick::Log.new("log/test.log")
  end

  def access_log
    []   
  end

  def finalize
    FileUtils.rm(SOURCE_NAME)
  end

  private

  def create_test_file
    content = "<posts></posts>"
    test_file = File.new(SOURCE_NAME, "w")
    test_file.write(content)
    test_file.close
  end
end