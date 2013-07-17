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
    XPath.each(source_document, "/posts/post") do |element|
      posts << (build_post_from element)
    end
    posts
  end

  def add post
    root = source_document.root
    post.id = root.attributes["next_id"].to_i
    root.attributes["next_id"] = post.id + 1
    root.add_element(build_element_from post)
    save root
  end

  def find id
    element = XPath.first(source_document, "/posts/post[@id='#{id}']")
    build_post_from element unless element.nil?
  end

  def save root
    formatter = Formatters::Pretty.new
    formatter.compact = true
    File.open(@source,"w"){|file| file.puts formatter.write(root,"")}
  end

  private

  def build_post_from element
    post = Post.new
    post.id = element.attributes["id"].to_i
    post.title = element.elements["title"].text
    post.content = element.elements["content"].text
    post
  end

  def build_element_from post
    element = Element.new("post")
    title = Element.new("title", element)
    content = Element.new("content", element)
    element.attributes["id"] = post.id
    title.text = post.title
    content.text = post.content
    element
  end

end