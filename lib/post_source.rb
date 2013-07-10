class PostSource
  attr_accessor :source
  def initialize source
    @source = source
  end

  def all
    ["Post 1", "Post 2", "Post 3"]
  end
end