class PostSource
  attr_accessor :source
  def initialize source
    @source = source
  end

  def all
    [Post.new, Post.new, Post.new]
  end
end