require 'date'

class Blog < Array

  def sort_by_date
    self.sort! { |x, y| x.date <=> y.date }
  end
  def publish
    self.sort_by_date.each do |post|
      puts post.sponsor ? "******#{post.title}******" : post.title
      puts post.text
    end
  end

end

class Post

  attr_reader :title, :date, :text, :sponsor

  def initialize(title, date, text, sponsor=false)
    @title = title
    @date = date
    @text = text
    @sponsor = sponsor
  end

end


p1 = Post.new("Rough trade", Date.new(2015,2,3), "Cool music store", "sponsor")
p2 = Post.new("Joan Miquel Oliver", Date.new(2014,2,3), "Era un homenet petit")

blog = Blog.new
blog << p1
blog << p2

blog.publish