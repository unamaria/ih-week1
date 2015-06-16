require 'date'
require 'colorize'
require 'io/console'
 
# Reads keypresses from the user including 2 and 3 escape character sequences.
# code from: https://gist.github.com/acook/4190379
def read_char
  STDIN.echo = false
  STDIN.raw!
 
  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  STDIN.echo = true
  STDIN.cooked!
 
  return input
end
# end of keypress.rb code

class Blog
  attr_reader :posts, :pages_w_posts

  def initialize
    @posts = []
    @pages_w_posts = []
    @current_page = 0
  end

  def sort_by_date(arr)
    arr.sort! { |x, y| x.date <=> y.date } # CHECK .SORT_BY
  end

  def publish_post(post)
    puts post.sponsor ? "******#{post.title}******" : post.title
    puts post.text
  end

  def print_pagination
    @pages_w_posts.each_index do |page_i| 
      print page_i == @current_page ? (page_i + 1).to_s.colorize(:red) + " " : (page_i + 1).to_s + " "
    end
  end

  def next_page
    @pages_w_posts[@current_page + 1].each do |post|
      publish_post(post)
    end  
    @current_page += 1 unless @current_page == @pages_w_posts.size - 1
    print_pagination  
  end

  def previous_page
    @pages_w_posts[@current_page - 1].each do |post|
      publish_post(post)
    end  
    @current_page -= 1 unless @current_page == 0
    print_pagination  
  end

  def changePage
    c = read_char
    if c == "\e[C" # right arrow
      next_page unless @current_page == @pages_w_posts.size - 1  
    elsif c == "\e[D" # left arrow
      previous_page unless @current_page == 0  
    end 
    c == " " ? return : changePage
  end

  def publish
    # sort
    sort_by_date(@posts)
    # organise in pages
    @temp_posts = @posts.dup # dup creates shallow copy
    while @temp_posts.size != 0
      first_3_posts = @temp_posts.slice!(0,3)
      @pages_w_posts << first_3_posts
    end
    # puts posts
    @pages_w_posts[0].each do |post|
      publish_post(post)
    end
    print_pagination
    changePage
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


p1 = Post.new("Rough trade", Date.new(1973,2,3), "Cool music store", "sponsor")
p2 = Post.new("Joan Miquel Oliver", Date.new(1988,2,3), "Era un homenet petit")
p3 = Post.new("Post number 3", Date.new(1999,2,3), "Era un homenet petit")
p4 = Post.new("Post number 4", Date.new(2000,2,3), "Era un homenet petit")
p5 = Post.new("Post number 5", Date.new(2001,2,3), "Era un homenet petit")
p6 = Post.new("Post number 6", Date.new(2002,2,3), "Era un homenet petit")
p7 = Post.new("Post number 7", Date.new(2003,2,3), "Era un homenet petit")
p8 = Post.new("Post number 8", Date.new(2004,2,3), "Era un homenet petit")
p9 = Post.new("Post number 9", Date.new(2010,2,3), "Era un homenet petit")

blog = Blog.new
blog.posts << p1
blog.posts << p2
blog.posts << p3
blog.posts << p4
blog.posts << p5
blog.posts << p6
blog.posts << p7
blog.posts << p8
blog.posts << p9
blog.publish
