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

###### Git prune branches
- http://erikaybar.name/git-deleting-old-local-branches/

###### Git list changes in commits
* Lines-changed by file `git diff --stat HEAD~5 HEAD`
  - `--numstat` instead gives the number of lines added and removed individually
  - `--shortstat` gives the total # of files and lines changed
- Full diff `git diff HEAD~4 HEAD~2`
- Total changed files with file status `git diff --name-status HEAD~5 HEAD^`
- Total changed files with file status by commit `git diff --name-status --oneline HEAD~12 HEAD~4`
- Total changed files `git diff --name-only HEAD~3 HEAD`
- Files changed in a commit `git show --name-only commit-SHA`

##### Merge Methods
###### Resolve Single File to either side
- `git checkout --ours -- file`
- `git checkout --theirs -- file`
  - The extra `--` is to prevent problems if your file is called, for instance, `theirs`
  - Each of these require you to `git add file` afterwards to resolve it
- `git checkout HEAD -- file`
  - This resolves to the current HEAD version (which should be ~= --ours)
  - This doesn't require you to `git add` afterwards, it immediately resolves
  
