class Post
  attr_accessor :id, :title, :content
  def initialize(title="", content="")
    @id = 1
    @title = title
    @content = content
  end
end