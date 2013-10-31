require 'sequel'
require 'sqlite3'

class PostStore

  def self.all
    database[:posts].to_a.map do |post_data|
      Post.new(post_data)
    end
  end

  def self.create(attributes)
    database[:posts].insert(attributes)
    Post.new(attributes)
  end

  def self.database
    return @database if @database && @database.table_exists?(:posts)
    unless ENV['RACK_ENV'] == 'test'
      @database = Sequel.sqlite('db/clone_wars.sqlite3')
    else
      @database = Sequel.sqlite('test/db/clone_wars.sqlite3')
    end
    unless @database.table_exists?(:posts)
      @database.create_table :posts do 
        primary_key :id
        String      :title
        String      :date
        String      :category
        String      :author
        Text        :body
      end
    end
    @database
  end

  def self.clear_table
    database.drop_table(:posts) if database.table_exists?(:posts)
  end

  def self.find(id)
    attributes = database.from(:posts).where(:id => id).to_a[0]
    if !attributes.nil?
      Post.new(attributes)
    end
  end
end
