require "rexml/document"
include REXML

class PostSource
  attr_accessor :source

  def initialize source
    @source = source
    doc = Document.new source
    @posts = Array.new
    XPath.each(doc, "/posts/post") do |post|
      content = post.elements["content"].text
      @posts << Post.new(content)
    end
  end

  def all
    @posts
  end
end