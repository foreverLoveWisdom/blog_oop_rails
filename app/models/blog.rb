class Blog
  attr_reader :entries
  attr_writer :post_source

  def title
    'What is my own limitations?'
  end

  def subtitle
    'Trying to maximize my impact while I am still alive'
  end

  def initialize
    @entries = []
  end

  def new_post(*args)
    post_source.call(*args).tap do |post|
      post.blog = self
    end
  end

  private

  def post_source
    @post_source ||= Post.public_method(:new)
  end
end
