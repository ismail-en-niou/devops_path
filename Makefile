all:
	git status
push:
	git add .
	git commit -m "Update files"
	git push origin main
pull:
	git pull origin main	
clean:
	git reset --hard HEAD
	git clean -fd
status:
	git status
log:
	git log --oneline --graph --decorate --all
diff:
	git diff
branch:
	git branch -a
checkout:
	git checkout main
merge:
	git merge main
rebase:	
	git rebase main