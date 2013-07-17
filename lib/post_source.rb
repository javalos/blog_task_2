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
      new_post = Post.new
      new_post.id = post.attributes["id"]
      new_post.title = post.elements["title"].text
      new_post.content = post.elements["content"].text
      posts << new_post
    end
    posts
  end

  def add post
    posts = source_document.root
    new_post = Element.new("post", posts)
    title = Element.new("title", new_post)
    content = Element.new("content", new_post)
    title.text = post.title
    content.text = post.content
    save posts
  end

  def save posts
    formatter = Formatters::Pretty.new
    formatter.compact = true
    File.open(@source,"w"){|file| file.puts formatter.write(posts,"")}
  end

end