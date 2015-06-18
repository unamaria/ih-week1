require 'terminfo'

class Terminal
  def initialize
    @term_info = TermInfo.screen_size
  end

  def height
    @term_info[0]
  end

  def width
    @term_info[1]
  end
end

class TextFileParser
  def initialize(file)
    @file = file
  end

  def run
    all_content = File.readlines(@file)
    selected_content = []
    all_content.each_with_index do |line, i|
      if (i % 2 == 0)
        selected_content.push(line.strip)
      end
    end
    selected_content
  end
end

class Slide
  attr_reader :show_slide, :place_slide
  def initialize(content, term)
    @content = content
    @term = term
  end

  def place_slide
    vertical = @term.height / 2 - 1
    horizontal = (@term.width - @content.length) / 2
    @content = ("\n" * (vertical / 2) +  " " * horizontal + @content + "\n" * (vertical / 2))
  end

  def show_slide
    puts place_slide
  end
end

class SlideGenerator
  def initialize(content_parsed)
    @content_parsed = content_parsed
    @slides = []
    @term = Terminal.new
  end
  def run
    @content_parsed.each do |content|
      slide = Slide.new(content, @term)
      slide.place_slide
      @slides << slide
    end 
    @slides  
  end
end

class Presentation
  def initialize(slides)
    @slides = slides
    @current_slide = 0
  end

  def navigation
    while @current_slide < @slides.length && @current_slide >= 0
      puts "CURRENT SLIDE: #{@current_slide}"
      input = get_input
      if input == "next"
        @current_slide += 1
        @slides[@current_slide].show_slide
      elsif input == "previous"
        @current_slide -= 1
        @slides[@current_slide].show_slide
      else 
        puts "Sorry, you can either type previous or next"
      end
    end 
  end

  def ask_input
    puts ">"
  end

  def get_input
    ask_input
    gets.chomp
  end

  def show
    @slides[@current_slide].show_slide
    navigation
  end

end

parsed_text = TextFileParser.new("slides.txt").run
slides = SlideGenerator.new(parsed_text).run
Presentation.new(slides).show
