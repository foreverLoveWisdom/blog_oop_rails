# frozen_string_literal: true

class Post
  attr_accessor :blog, :title, :body

  def initialize(attributes)
    attributes.each do |attribute, attribute_value|
      send("#{attribute}=", attribute_value)
    end
  end

  def publish
    blog.add_entry(self)
  end
end
