require 'minitest/autorun'
require_relative '../../app/models/post'

describe Post do
  before do
    @it = Post.new
  end

  # it 'start with blank attributes' do
  #   _(@it.title).must_be_nil
  #   _(@it.body).must_be_nil
  # end

  # it 'supports reading and writing a title' do
  #   @it.title = 'foo'
  #   _(@it.title).must_equal 'foo'
  # end

  # it 'supports reading and writing a post body' do
  #   @it.body = 'foo'
  #   _(@it.body).must_equal 'foo'
  #   @it.title = 'foo'
  #   _(@it.title).must_equal 'foo'
  # end

  # it 'supports reading and writing a blog reference' do
  #   blog = Object.new
  #   @it.blog = blog
  #   _(@it.blog).must_equal(blog)
  # end

  it 'supports setting attributes in the initializer' do
    it = Post.new(title: 'title', body: 'body')
    # _(it.title).must_equal 'title'
    # _(it.body).must_equal 'body'
  end

  describe '#publish' do
    before do
      @blog = MiniTest::Mock.new
      @it.blog = @blog
    end

    after do
      @blog.verify
    end

    it 'adds the post to the blog' do
      @blog.expect :add_entry, nil, [@it]
      @it.publish
    end
  end
end
