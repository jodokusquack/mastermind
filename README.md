## MASTERMIND

This is the game Mastermind, played on the command line. 

To play it clone this repo and execute
the file "mastermind.rb" or you can
play it online on [![Run on Repl.it](https://repl.it/badge/github/jodokusquack/mastermind)](https://repl.it/github/jodokusquack/mastermind).

The objective of the Codebreaker is to guess the Codemaker's Colorcode in 10 turns or less.
After each guess the Codemaker gives some hints about the guess that was made:

* ![#ffffff](https://via.placeholder.com/15/FFFFFF?text=+) White means one of the colors guessed was correct but in the wrong position.
* ![#00ff00](https://via.placeholder.com/15/00FF00?text=+) Green means one of the colors guessed was correct and also in the correct position.

The code consist of 4 colours in a specific order (this can be changed in the MastermindUtilities module). Colours can appear more than once in the code.

The following colors are possible:
* ![#ff0000](https://via.placeholder.com/15/FF0000?text=+) Red (r)
* ![#0000ff](https://via.placeholder.com/15/0000FF?text=+) Blue (b)
* ![#00ffff](https://via.placeholder.com/15/00FFFF?text=+) Cyan (c)
* ![#808080](https://via.placeholder.com/15/808080?text=+) Gray (g)
* ![#ffff00](https://via.placeholder.com/15/FFFF00?text=+) Yellow (y)
* ![#ff00ff](https://via.placeholder.com/15/FF00FF?text=+) Magenta (m)

If you are trying to break the code,
you can type "hints" to get a list of
all previous guesses and hints. Also
typing "new" starts a new game
immediately.

This is a project from [The Odin Project](https://www.theodinproject.com/), a free curriculum for learning web development.
