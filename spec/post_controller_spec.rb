require 'webrick'
require 'net/http'
require "controller"
require "post_controller"
require "test_config"
require "server"

describe PostController do
  before(:all) do
    @server = Server.new(TestConfig.new)
    Thread.new do
      @server.start
    end
  end

  after(:all) do
    @server.shutdown unless @server.nil?
  end

  describe "index" do
    it "should blbla" do
      response = get "/"
      response.code.should eq "200"
    end
  end

  def get path
    Net::HTTP.get_response('localhost', path, TestConfig.port)
  end
end