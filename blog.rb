require 'date'

class Blog < Array

  def sort_by_date
    self.sort! { |x, y| x.date <=> y.date }
  end
  def publish
    self.sort_by_date.each do |post|
      puts post.title
      puts post.text
    end
  end

end

class Post

  attr_reader :title, :date, :text

  def initialize(title, date, text)
    @title = title
    @date = date
    @text = text
  end

end
