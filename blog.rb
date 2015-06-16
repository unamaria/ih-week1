require 'date'
require 'colorize'

class Blog < Array

  def initialize 
    @current_last_post = 2
    @current_page = 1
  end

  def publish_post(post)
    puts post.sponsor ? "******#{post.title}******" : post.title
    puts post.text
  end

  def paginate
    posts = self.size
    i = 1
    while posts > 0
      print i == @current_page ? "#{i} ".colorize(:red) : "#{i} "
      posts -= 3
      i += 1
    end      
  end 

  def sort_by_date(arr)
    arr.sort! { |x, y| x.date <=> y.date } # CHECK .SORT_BY
  end

  def publish_front_page
    # PUBLISH 3 POSTS
    self.sort_by_date(self.first(3)).each do |post|
      publish_post(post)
    end
    paginate
  end 

  def publish_next_page
    self.slice(@current_last_post + 1, self.size).first(3).each do |post|
      publish_post(post)
      @current_last_post = self.index(post)
    end
    @current_page += 1 unless @current_page == 3
    paginate
  end

  def publish_previous_page
    self.slice(@current_last_post - 5, self.size).first(3).each do |post|
      publish_post(post)
      @current_last_post = self.index(post)
    end
    @current_page -= 1 unless @current_page == 1
    paginate
  end

  def changePage
    c = read_char
    if c == "\e[C" # right arrow
      publish_next_page unless @current_page == 3       
    elsif c == "\e[D" # left arrow
      publish_previous_page unless @current_page == 1      
    end 
    c == " " ? return : changePage
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
