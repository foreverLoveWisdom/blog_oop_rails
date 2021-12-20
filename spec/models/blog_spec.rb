require 'minitest/autorun'
require_relative '../../app/models/blog'
require 'ostruct'

describe Blog do
  before do
    @it = Blog.new
  end

  it 'has no entries' do
    _(@it.entries).must_be :empty?
  end

  describe '#new_post' do
    before do
      @new_post = OpenStruct.new
      @it.post_source = -> { @new_post }
    end

    it 'returns a new post' do
      _(@it.new_post).must_equal @new_post
    end

    it "sets the post's blog reference to itself" do
      _(@it.new_post.blog).must_equal @it
    end
  end
end
