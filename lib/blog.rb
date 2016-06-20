class Blog
  include Enumerable

  attr_reader :posts

  def initialize(posts = [])
    @posts = posts
  end

  def each(&block)
    @posts.each do |post|
      block.call(post)
    end
  end

  def empty?
    posts.empty?
  end

end
