require 'webrick'

Dir['lib/*.rb'].each do |file|
  require File.join(File.dirname(__FILE__), file)
end
 
include WEBrick

server = HTTPServer.new(:Port=>2000, :DocumentRoot=>'./public')
trap("INT"){ server.shutdown }
server.start