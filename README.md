# README

## Clone Branch
1. Got to the folder where you want your project: `cd [folder_path]`
2. `git clone -b branch_name git@github.com:StefNijenhuis/Vivorbi.git`

## Selecting a Branch
1. Go to project folder: `cd [folder_path]`
2. Check active branch: `git branch`
3. Select branch branch_name: `git checkout --track origin/branch_name`
4. `git pull`

## Merge Branch to master
In order to merge a branch to the master branch you need to do the following
1. Checkout to the master branch `git checkout master`
2. `git merge branch_name`

## Reverting to a previous commit
1. Use `git log` to view a list of commits. the SHA hash is the commit-id you're looking for, or look on github for the commit-id
2. `git reset --hard commit-id`
3. `git push -f`

## Pushing to a different remote branch
1. `git push origin local_branch:remote_branch

## Remove a local branch
1. `git branch -d branch_name`

## Get things running
1. `bundle`
2. `rake db:migrate`
3. `rake db:seed`

## Resetting the database
* Reset will clear the database and run migrate for you.
1. `rake db:reset`

## Installing ImageMagick
In order for image manipulation to work you'll need to install ImageMagick
* Linux/Debian: `sudo apt-get install imagemagick`
* MacOS: `brew install imagemagick```

## Run server
* `rails s`

[Markdown CheatSheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
