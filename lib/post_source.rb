require "rexml/document"
include REXML

class PostSource
  attr_accessor :source

  def initialize source
    @source = source
    @posts = Array.new
    load_source
  end

  def load_source
    @doc = Document.new @source
    XPath.each(@doc, "/posts/post") do |post|
      content = post.elements["content"].text
      @posts << Post.new(content)
    end
  end

  def all
    @posts
  end

  def add post
    @posts << post
    add_to_source post
    save
  end

  def add_to_source post
    posts_element = @doc.root
    post_element = Element.new("post", posts_element)
    content_element = Element.new("content", post_element)
    content_element.text = post.content
  end

  def save
    if source.instance_of?(File)
      formatter = Formatters::Pretty.new
      formatter.compact = true
      File.open(@source.path,"w"){|file| file.puts formatter.write(@doc.root,"")}
    end
  end

end