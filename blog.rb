require 'date'
require 'colorize'

class Blog

  def initialize 
  end

  def publish_post(post)
    puts post.sponsor ? "******#{post.title}******" : post.title
    puts post.text
  end

  def paginate    
  end 

  def sort_by_date(arr)
    arr.sort! { |x, y| x.date <=> y.date } # CHECK .SORT_BY
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
p3 = Post.new("Post number 3", Date.new(2017,2,3), "Era un homenet petit")
p4 = Post.new("Post number 4", Date.new(2014,2,3), "Era un homenet petit")
p5 = Post.new("Post number 5", Date.new(2014,2,3), "Era un homenet petit")
p6 = Post.new("Post number 6", Date.new(2014,2,3), "Era un homenet petit")
p7 = Post.new("Post number 7", Date.new(2014,2,3), "Era un homenet petit")
p8 = Post.new("Post number 8", Date.new(2014,2,3), "Era un homenet petit")
p9 = Post.new("Post number 9", Date.new(2014,2,3), "Era un homenet petit")

blog = Blog.new
blog << p1
blog << p2
blog << p3
blog << p4
blog << p5
blog << p6
blog << p7
blog << p8
blog << p9 # IF LAST PAGE HAS 2 POSTS METHODS DON'T WORK


blog.publish_front_page
blog.changePage
