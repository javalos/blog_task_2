require "rexml/document"
include REXML

class PostSource
  attr_accessor :source

  def initialize source
    @source = source
  end

  def source_document
    Document.new File.new(@source)
  end

  def all
    posts = Array.new
    XPath.each(source_document, "/posts/post") do |post|
      content = post.elements["content"].text
      posts << Post.new(content)
    end
    posts
  end

  def add post
    posts = source_document.root
    new_post = Element.new("post", posts)
    content = Element.new("content", new_post)
    content.text = post.content
    save posts
  end

  def save posts
    formatter = Formatters::Pretty.new
    formatter.compact = true
    File.open(@source,"w"){|file| file.puts formatter.write(posts,"")}
  end

end