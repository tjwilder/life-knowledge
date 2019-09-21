### vim
The .vimrc (outdated) is currently committed with more individual configurations to come
#### The "Language" of Vim
Vim's actually pretty simple. You can think of its command as a little language. For most simple commands we have a few parts, a quantifier (or two), an operator, and a motion.
- A quantifier is just the number of times you want to execute the command
- An operator is the command you want to execute
- A motion represents the stuff that you want to run the command on

We'll go over some basic "words" in the language, and then stick them together to make simple commands.
- Quantifiers: 1, 2, 3...
- Operators: d (delete), y (yank/copy), c (change)
- Motions: w (word), b (back a word), j (down), p (paragraph)
	This means the operating area for the motion is like "from here to the start of the next (word/paragraph)".
We get some more complicated ones as well but we'll use these for now.
Let's do some simple commands.
	Want to delete a word? Type `dw`.
	Want to change the previous 2 words? Type `2cb` (change from here to the start of the current word twice)

Let's define the motions in a bit more detail and add some more
w (jump to the start of the next _word_)
b (jump to the start of the current/previous _word_)
h, l (one character left/right)
k, j (one line up/down)
% (jump to matching [], (), {}, maybe more)

Now we have some modifiers (they're like adjectives in our language)
i (inner)
	`iw` (inner word is a motion for the entire current word)
	`i)` (inner ) is a motion for everything inside the current parens)
a (around)
	`aw` (around word is a motion for a word plus one space just around it)
	`a}` (around } is a motion for everything inside the current curly braces plus the braces themselves)

So revisiting, when we want to delete words, what we probably want is
	`daw` which deletes the current word and one of the spaces around it

#### How to macro
  1. `q{macro key}q` clears existing macro (prevents you from messing up a recursive macro)
  2. `q{macro key}` starts macro
  3. record macro
  4. `@{macro key}` to make it recursive (if desired)
    - To repeat until the end of a line, insert an `l h` before this to go forward (which will fail at the end of the line) and back
  5. `q` ends macro
  6. `@{macro key}` runs the macro

#### keymaps and shortcuts
- :map gives a list of all keymaps
- :map [keycombo] tells you what that keymapping does
- :verbose map [keycombo] also tells you where the mapping came from
- The same idea works with other maps like nmap and vmap
