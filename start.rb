require 'webrick'

Dir['lib/*.rb'].each do |file|
  require File.join(File.dirname(__FILE__), file)
end
 
include WEBrick

port = 2000
server = HTTPServer.new(:Port=>2000)
trap("INT"){ server.shutdown }
server.start