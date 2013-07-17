class Post
  attr_accessor :id, :title, :content

  def initialize attributes={}
    attributes.each do |attr,value|
      send("#{attr}=", value)
    end
  end
end