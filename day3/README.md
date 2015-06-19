# Console keynote

## Iteration 1: The keynote

First, make a text file to store the presentation content ( for example, slides.txt). Each “slide” is one line of text, and the lines of text are divided by four dashes ----. 

In the same folder, create a new file for your Ruby program (for example, keynote.rb). This program should read the text file and present the lines of text in the terminal as slides.

The text will be centered in the terminal, horizontally and vertically. You can use ruby-terminfo to get the size of the terminal.

At the bottom of the terminal, you need to show a prompt > that can take the following commands:

* next: For the next slide (unless it’s the last slide)
* previous: For the previous one (unless it’s the first slide)

When the user enters next, the next line of the text file should appear on the terminal, centered and with the prompt at the bottom, until you reach the last line.

## Iteration 2: Auto-advance

Add an option to auto advance: add a command called auto that will move to the next slide every 3 seconds until the last slide. Once in auto advance mode, there should be no user prompt.

## Iteration 3: Multi-line slides

So far, all of our slides are just one line of text. But what if we want to add some multi-line slides or cool graphics to our presentation? We need to add support for slides that are more than one line. The multi-line content should still be centered vertically and horizontally on the screen.