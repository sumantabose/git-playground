# Git-Playground
#### Compiled by [Sumanta Bose](https://sumantabose.github.io)
##### Email: [sumanta001@e.ntu.edu.sg](mailto:sumanta001@e.ntu.edu.sg)

[![N|Solid](https://cdn.kualo.com/blogassets/wp-content/uploads/2015/11/git.jpg)](https://nodesource.com/products/nsolid)

This is a playground to learn and practice git commands and implementation details. Here we will learn how Git works.

## Working on a local repo and pushing it to remote

```sh
$ git clone <URL>  or git init
$ git diff
$ git status
$ git add <filenames> (to undo use git reset <filenames>)
$ git commit -m “message” or git commit
$ git push
$ git pull
<work on files>
$ git status
… repeat
```


## Getting rid of untracked files and directories
```sh
$ git clean -df (d for directory and f for file)
```
## Branching out and merging back to master v1
```sh
$ git branch
$ git branch feature1
$ git checkout feature1
	<work on files>
	$ git diff
	$ git status
	$ git add <filenames>
	$ git commit -m “message” or git commit
$ git checkout master
$ git pull
$ git checkout feature1
$ git merge master
$ git push (git push --set-upstream origin feature1)
send a pull request to other members
after someone accepts the pull request, you may or may not delete the branch
```

## To see ...
```sh
$ git remote -v
$ git branch -a
```

## Make sure to pull master before pushing 
### (others might have done some commits/pushes in the meanwhile)
```sh
$ git pull origin master
$ git push origin master
$ git push -u origin <branchname> (and git push in future)
```

## Branching out and merging back to master v2
```sh
> add, commit, push <branchname>
$ git checkout master
$ git pull origin master (to get updated with the current code before merging/pushing)
$ git branch —merged (shows branches that have been merged so far)
$ git merge <branchname>
$ git push origin master
```

## Deleting a merged branch
```sh
$ git branch —merged
$ git branch -d <branchname>
$ git branch -a
$ git push origin —delete <branchname>
```

## Reverting to original file after saving some wrong stuff
```sh
$ git diff : gives the difference in file contents between the last committed (or pushed idk) and the current version of the files
$ git checkout <filename> : goes back to the last committed (or pushed idk) version of the file
```

## To ammend a commit message immediately
```sh
$ git commit --amend -m "New Commit Message" : overwrites the last commit message to "New Commit Message". 
This changes the commit hash and git log history.
```

## To immediately include newly added files to a previous commit
```sh
$ git commit --amend + (Esc+:wq) : this will commit any newly added files as part of the last commit
$ git log —stat : this will show a list of the files that have been changed in the commit
```

## Copy a commit from one branch to another
```sh
stay in the <from-branch>
$ git log & copy the first few characters of the commit you want to copy
$ git checkout <to-branch>
$ git checkout <to-branch>
$ git cherry-pick <hash> : this copies the commit from the <from-branch> to the <to-branch>, does not delete the commit in the <from-branch>
$ git checkout <to-branch> : move back to the <to-branch>
now we need to use git reset to remove the commit in the <from-branch>
```

## Using git reset
### Types of git reset:
```sh
- soft reset : $ git reset --soft <hash> : resets back to the <hash> but keeps changes in the staging area. See git status
- mixed reset (default) : $ git reset <hash> :  resets back to the <hash> but does not keep changes in the staging area, rather keeps them in working area. See git status
- git reset hard : $ git reset —hard <hash> : resets back to the <hash> and keeps no changes in the staging or working area. See git status
```

## To recover commits deleted using git hard reset 
```sh
$ git reflog
$ git checkout <hash-before-reset>
$ git log (and check)
$ git branch <backup-branch> (this creates a new branch with the <hash-before-reset> state)
$ git checkout master (back to master)
$ git branch -a (you have recovered the <backup-branch> if you need it)
```

## Revert changes made in previous commits without changing history
### (important while working in a group, coz you don’t want to mess up other’s history)
```sh
$ git log
$ git revert <hash-of-commit-to-revert>
$ git log
$ git diff <hash-of-reverted-commit> <hash-of-new-commit-after-reverting>
```

# License
Free to clone, distribute and reuse.