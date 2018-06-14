### Regex
Try things out here: [Regex101](https://regex101.com/)

###### Important things to remember
- Character range `[a-z]` or `[0-3]`
- Character list `[012]` matches 0, 1, or 2
- Occurences as in `[a-f]+` (1+ occurences of any characters in `a-f` [eg. "fabb"])
  - `?` is 0-1
  - `*` is 0+
  - `+` is 1+
  - `{n}` is exactly n
  - `{n,}` is n+
  - `{n,m}` is between n and m (inclusive)
- Start of string `^`
- End of string `$`
- Any character `.`
- Any digit `\d` (non-digit `\D`)
- Any word character `\w` (non-word `\W`)
- Any whitespace `\s` (non-whitespace `\S`)
- Either `a|b` matches exactly one of `a` and `b`
