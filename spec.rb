require 'test_javalos'

Dir['spec/*.rb'].each do |file|
  require File.join(File.dirname(__FILE__), file)
end

server = Server.new(TestConfig.new)
Thread.new do
  server.start
end

TestJavalos.run

server.shutdown