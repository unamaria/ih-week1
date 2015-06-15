class Blog < Array 

  def publish
    self.each do |post|
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
