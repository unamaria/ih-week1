require 'terminfo'

class TextFileParser
  def initialize(file)
    @file = file
  end

  def run
    content = File.readlines(@file)
    slides = []
    content.each_with_index do |line, i|
      if (i % 2 == 0)
        slides.push(line.strip)
      end
    end
    slides
  end
end

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

class Presentation
  def initialize(slides)
    @slides = slides
    @current_slide = 0
    @term = Terminal.new
  end

  def place_slide(slide)
    vertical = @term.height / 2 - 1
    horizontal = (@term.width - slide.length) / 2
    ("\n" * vertical) +  " " * horizontal + slide + ("\n" * vertical)
  end

  def show_slide
    puts place_slide(@slides[@current_slide])
  end

  def navigation
    while @current_slide < @slides.length
      input = get_input
      if input == "next"
        @current_slide += 1
        show_slide
      elsif input == "previous"
        @current_slide -= 1
        show_slide
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
    show_slide
    navigation
  end

end

slides = TextFileParser.new('slides.txt').run
Presentation.new(slides).show
