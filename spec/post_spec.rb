require 'post'

describe Post do

  context "when created" do

    before(:each) do
      @post = Post.new({id: 1, content: "Post content", title: "Post title"})
    end

    it "should have id" do
      @post.id.should eq 1
    end

    it "should have title" do
      @post.title.should eq "Post title"
    end

    it "should have content" do
      @post.content.should eq "Post content"
    end
  end
end