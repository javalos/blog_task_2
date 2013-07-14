require 'webrick'

Dir['lib/*.rb'].each do |file|
  require File.join(File.dirname(__FILE__), file)
end

server = Server.new
server.start