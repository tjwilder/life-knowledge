## Some general notes to remember for development

### rspec

###### Max Output Length
`RSpec::Support::ObjectFormatter.default_instance.max_formatted_output_length = n`

Allows you to increase the length of your rspec outputs so you can see what's actually go wrong in long messages

##### General Tips
- Have a `before(:each)` block to test your shared expectations
- RSpec runs with `RAILS_ENV="test"` so be aware of configurations differences (especially secrets)

### Git

###### GitHub Un-commit
Accidentally pushed something to GitHub you weren't supposed to? Have no (read: some) fear! Though GitHub will likely cache the commit regardless (see [StackOverflow](https://stackoverflow.com/questions/448919/how-can-i-remove-a-commit-on-github)), you can just run a few things to fix it:
1. `git stash` to clean the working branch
2. `git reset --soft HEAD^` to undo the commit (everything in the commit will be staged)
3. `git reset FILE_NAME` to un-stage each file you didn't want to commit
4. `git commit` your new commit
5. `git push origin +branchName` to force push to your branch (overriding it's existing history)

###### Cherry-pick a single commit to add
1. Checkout branch that has the commit
2. `git log` and copy the first part of the hash of the commit
3. Checkout branch to add the commit to
4. `git cherry-pick <commit ID of xx>` to add that commit to the current branch

  [Reference: StackOverflow](https://stackoverflow.com/questions/14635672/git-rebase-a-single-commit)

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
