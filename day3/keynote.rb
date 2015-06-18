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
    ("\n" * (vertical) +  " " * horizontal + @content + "\n" * (vertical))
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

  def ask_input
    puts ">"
  end

  def get_input
      ask_input
      gets.chomp
  end

  def first_slide?
    @current_slide < 0
  end

  def last_slide?
    @current_slide > (@slides.length - 1)
  end

  def show_slide
    @slides[@current_slide].show_slide
  end

  def auto_nav
    while @current_slide != @slides.length - 1
      @current_slide += 1
      show_slide
      sleep 3
    end
    exit
  end

  def navigation
    while !first_slide? && !last_slide? 
      input = get_input
      case input
      when "auto"
        auto_nav
      when "next"
        @current_slide += 1
        if last_slide?
          exit
        else
          show_slide
        end
      when "previous"
        @current_slide -= 1
        if first_slide?
          exit
        else
          show_slide
        end
      when "q"
        exit
      else
        puts "Sorry, you can either type previous or next"
      end
    end 
  end

  def show
    @slides[@current_slide].show_slide
    navigation
  end
end

parsed_text = TextFileParser.new("slides.txt").run
slides = SlideGenerator.new(parsed_text).run
Presentation.new(slides).show
