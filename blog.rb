class Blog < Array 

  def create_front_page
  end

  def publish_front_page
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
