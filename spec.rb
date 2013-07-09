require 'test_javalos'

Dir['spec/*.rb'].each do |file|
  require File.join(File.dirname(__FILE__), file)
end

TestJavalos.run