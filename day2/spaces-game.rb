class Space
  attr_accessor :description, :wayouts, :input_error

end

stomach = Space.new
stomach.description = "You are in the stomach. You can move to the throat by moving North." 
stomach.input_error = "You just hit your head to a stomach wall!"