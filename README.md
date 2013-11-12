# README

## Clone Branch
`git clone -b branch_name git@github.com:StefNijenhuis/Vivorbi.git`

## Branch
* Go to project folder: `cd [folder_path]`
* Check active branch: `git branch`
* Select branch branch_name: `git checkout --track origin/branch_name`
* `git pull`

## Reverting to a previous commit
1. Use `git log` to view a list of commits. the SHA hash is the commit-id you're looking for, or look on github for the commit-id
2. `git reset --hard commit-id`
3. `git push -f`

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
