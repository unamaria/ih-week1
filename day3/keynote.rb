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
    height = @term_info[0]
  end

  def width
    width = @term_info[1]
  end
end

class Presentation
  def initialize(slides)
    @slides = slides
    @current_slide = 0
  end

  def place_slide(slide)
    term = Terminal.new
    vertical = term.height / 2 - 1
    horizontal = (term.width - slide.length) / 2
    slide = ("\n" * (vertical / 2)) +  " " * horizontal + slide + ("\n" * (vertical / 2))
  end

  def show_slide
    puts place_slide(@slides[@current_slide])
  end

  def show
    show_slide
    if get_input == "next"
      @current_slide += 1
      show_slide
      get_input
    elsif input == "previous"
      @current_slide -= 1
      show_slide
      get_input
    else 
      puts "Sorry, you can either type previous or next"
    end 
  end

  def ask_input
    puts ">"
  end

  def get_input
    ask_input
    input = gets.chomp
  end

end

slides = TextFileParser.new('slides.txt').run
Presentation.new(slides).show
