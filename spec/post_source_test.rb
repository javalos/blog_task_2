class PostSourceTest < TestJavalos
  SOURCE_NAME = "post_source_test.xml"

  def test_initialize
    post_source = PostSource.new("")
    assert_not_null post_source.source
    assert_not_null post_source
  end

  def test_post_source
    post_source = PostSource.new(SOURCE_NAME)
    assert_equals SOURCE_NAME, post_source.source
  end

  def test_post_all
    create_test_file
    post_source = PostSource.new(SOURCE_NAME)
    posts = post_source.all
    assert_not_null posts
    assert_equals 3, posts.length
    posts.each { |post| assert_equals true, post.instance_of?(Post)  }
    assert_equals "Post 1", posts[0].content
    assert_equals "Post 2", posts[1].content
    assert_equals "Post 3", posts[2].content
    delete_test_file
  end

  def test_post_create
    create_test_file
    post_source = PostSource.new(SOURCE_NAME)
    posts = post_source.all
    count_before = posts.count
    post_source.add Post.new("Another post")
    posts = post_source.all
    assert_equals count_before + 1, posts.count
    delete_test_file
  end

  private

  def create_test_file
    content =  
      "<posts>
        <post><content>Post 1</content></post>
        <post><content>Post 2</content></post>
        <post><content>Post 3</content></post>
      </posts>"
    test_file = File.new(SOURCE_NAME, "w")
    test_file.write(content)
    test_file.close
  end

  def delete_test_file
    FileUtils.rm(SOURCE_NAME)
  end
end