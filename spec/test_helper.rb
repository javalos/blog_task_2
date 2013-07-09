require 'webrick'
require 'test_javalos'

Dir['lib/*.rb'].each do |file|
  require File.join(File.dirname(__FILE__), "../" + file)
end