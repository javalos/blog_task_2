require 'webrick'

Dir['lib/*.rb'].each do |file|
  require File.join(File.dirname(__FILE__), file)
end
 
include WEBrick

post_source = PostSource.new(File.new("posts.xml"))

server = HTTPServer.new(:Port=>2000, :DocumentRoot=>'./public')
server.mount "/posts", PostController, post_source
trap("INT"){ server.shutdown }
server.start