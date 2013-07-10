class PostSource
  attr_accessor :source
  def initialize source
    @source = source
  end

  def all
    []
  end
end