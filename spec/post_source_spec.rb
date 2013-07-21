require "post_source"

describe PostSource do

  context "when created" do
    it "should have a source" do
      post_source = PostSource.new("source_name.xml")
      post_source.source.should eq("source_name.xml")
    end
  end

  context "when fetching posts" do

    before(:each) do
      content = 
        "<posts next_id='4'>
          <post id='1'><title>Title 1</title><content>Post 1</content></post>
          <post id='2'><title>Title 2</title><content>Post 2</content></post>
          <post id='3'><title>Title 3</title><content>Post 3</content></post>
        </posts>"
      document_source = Document.new content
      @source = PostSource.new("source_name.xml")
      @source.stub(:source_document).and_return(document_source)
    end

    it "should retrieve each posts with all properties"  do
      posts = @source.all
      posts.should have(3).items
      posts.each { |post| post.should be_kind_of(Post)  }
      posts[0].id.should eq(1)
      posts[1].title.should eq("Title 2")
      posts[2].content.should eq("Post 3")
    end

    it "should find a existing post by id" do
      post = @source.find 2
      post.id.should eq(2)
      post.title.should eq("Title 2")
      post.content.should eq("Post 2")
    end

    it "should not find a no existing post" do
      post = @source.find 123
      post.should be_nil
    end
  end

  context "when creating post" do
    it "should add a new post" do
      source = PostSource.new("source_name.xml")
      source.stub(:source_document).and_return(Document.new "<posts next_id='30'></posts>")
      source.stub(:save => true)
      source.all.should have(0).items
      source.add Post.new(({content: "Post", title: "Title"}))
      posts = source.all
      posts.should have(1).items
      posts.last.id.should eq(30)
    end
  end
end