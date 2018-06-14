### vim
Really cool, my config will be committed at some point (I hope). For now, here's some notes
- How to macro
  1. `q{macro key}q` clears existing macro (prevents you from messing up a recursive macro)
  2. `q{macro key}` starts macro
  3. record macro
  4. `@{macro key}` to make it recursive (if desired)
    - To repeat until the end of a line, insert an `l h` before this to go forward (which will fail at the end of the line) and back
  5. `q` ends macro
  6. `@{macro key}` runs the macro
