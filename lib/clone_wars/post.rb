class Post

  attr_accessor :title, :date, :category, :author, :body

  def initialize(attributes = {})
    @title = attributes[:title]
    @date = attributes[:date]
    @category = attributes[:category]
    @author = attributes[:author]
    @body = attributes[:body]
  end

  def url
    title.gsub(' ', '-').downcase.gsub(/[^\w-]/, '')
  end
end
