require 'test_helper'
require './lib/clone_wars'

class PostTest < MiniTest::Test

  attr_reader :post, :attributes

  def setup
    @attributes = {
      :title => 'Title of Post',
      :date => 'April 30, 2013',
      :category => 'News',
      :author => 'Sam',
      :body => 'This is the body.'
    }
    @post = Post.new(@attributes)
  end

  def test_post_exists
    assert Post
  end

  def test_it_has_all_five_attrs
    assert_equal attributes[:title], post.title
    assert_equal attributes[:date], post.date
    assert_equal attributes[:category], post.category
    assert_equal attributes[:author], post.author
    assert_equal attributes[:body], post.body
  end

  def test_post_has_a_url
    assert_equal "title-of-post", post.url
  end

  def test_post_has_a_clean_url
    post = Post.new(title: 'My funny valentine?')
    assert_equal 'my-funny-valentine', post.url
  end
end
