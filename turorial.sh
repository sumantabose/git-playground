

WORKING ON A LOCAL REPO AND PUSHING IT TO REMOTE
git clone <URL>  or git init
git diff
git status
git add <filenames> (to undo use git reset <filenames>)
git commit -m “message” or git commit
git push
git pull
<work on files>
git status
… repeat

BRANCHING OUT AND MERGING BACK TO MASTER v1
git branch
git branch feature1
git checkout feature1
	<work on files>
	git diff
	git status
	git add <filenames>
	git commit -m “message” or git commit
git checkout master
git pull
git checkout feature1
git merge master
git push (git push --set-upstream origin feature1)
send a pull request to other members
after someone accepts the pull request,
you may or may not delete the branch

TO SEE ….
git remote -v
git branch -a

MAKE SURE TO PULL MASTER BEFORE PUSHING 
(others might have done some commits/pushes in the meanwhile)
git pull origin master
git push origin master
git push -u origin <branchname> (and git push in future)

BRANCHING OUT AND MERGING BACK TO MASTER v2
> add, commit, push <branchname>
git checkout master
git pull origin master (to get updated with the current code before merging/pushing)
git branch —merged (shows branches that have been merged so far)
git merge <branchname>
git push origin master

DELETING A MERGED BRANCH
git branch —merged
git branch -d <branchname>
git branch -a
git push origin —delete <branchname>

REVERTING TO ORIGINAL FILE AFTER SAVING SOME WRONG STUFF
git diff : gives the difference in file contents between the last committed (or pushed idk) and the current version of the files
git checkout <filename> : goes back to the last committed (or pushed idk) version of the file

TO AMMEND A COMMIT MESSAGE IMMEDIATELY
git commit --amend -m "New Commit Message" : overwrites the last commit message to "New Commit Message". This changes the commit hash and git log history.

TO IMMEDIATELY INCLUDE NEWLY ADDED FILES TO A PREVIOUS COMMIT
git commit --amend + (Esc+:wq) : this will commit any newly added files as part of the last commit
git log —stat : this will show a list of the files that have been changed in the commit


COPY A COMMIT FROM ONE BRANCH TO ANOTHER
stay in the <from-branch>
git log & copy the first few characters of the commit you want to copy
git checkout <to-branch>
git cherry-pick <hash> : this copies the commit from the <from-branch> to the <to-branch>, does not delete the commit in the <from-branch>
git checkout <to-branch> : move back to the <to-branch>
Now we need to use git reset to remove the commit in the <from-branch>
Types of git reset:
- git reset soft
- git reset mixed (default) 
- git reset hard






