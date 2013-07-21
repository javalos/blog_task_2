require 'test_javalos_runner'
require 'test_javalos'

Dir['spec/*.rb'].each do |file|
  require File.join(File.dirname(__FILE__), file)
end

server = Server.new(TestConfig.new)
Thread.new do
  server.start
end

test_runner = TestJavalosRunner.new
test_runner.start

server.shutdown