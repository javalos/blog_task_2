class PostController < Controller
  
  def index
    puts "...index"
    posts = source.all
    body = "<h1>Posts:</h1>"
    posts.each do |post|
      body = body + "<p>#{post.title} <a href='/posts/#{post.id}'>View</a></p>"
    end
    body = body + "<a href='/posts/new'>New</a>"
    html_with body
  end

  def new
    puts "...new"
    body = 
      "<h1>New Post:</h1>
      <form action='/posts/create' method='post'>
        Title: <input type='text' name='title'>
        Content: <input type='text' name='content'>
        <input type='submit' value='Create'>
      </form>"
    html_with body
  end

  def show
    puts "...show"
    post = source.find params["id"]
    if post
      body = 
        "<h1>#{post.title}</h1>
        <p>#{post.content}</p>
        <p><a href='/posts'>Back</a></p>"
      html_with body
    end
  end

  def create
    puts "...create"
    post = Post.new({title: params["title"], content: params["content"]})
    source.add post
    redirect_to "/posts"
  end
end