require 'test_helper'
require './lib/clone_wars'

class PostStoreTest < MiniTest::Test

  def teardown
    PostStore.clear_table
  end

  def test_post_store_exists
    assert PostStore
  end

  def test_it_has_a_database
    assert PostStore.database
  end

  def test_it_creates_post
    post = Post.new(title: 'Test create')
    assert_kind_of Post, post
    assert_equal 'Test create', post.title
  end

  def test_it_gets_all_posts
    posts = PostStore.all
    assert_equal [], posts
    PostStore.create(title: 'First One')
    PostStore.create(title: 'Second One')
    assert_equal 2, PostStore.all.count
  end

  def test_find_a_post_by_id
    PostStore.create(title: 'Fitness')
    assert_equal 'Fitness', PostStore.find(1).title
  end
end
