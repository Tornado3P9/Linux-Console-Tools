# GitHub
[Git & GitHub Tutorial for Beginners](https://www.youtube.com/playlist?list=PL4cUxeGkcC9goXbgTDQ0n_4TBzOO0ocPR)  
[Learn Git Branching Interactive](https://learngitbranching.js.org/)  
[How to create development branch from master on GitHub](https://stackoverflow.com/questions/39478482/how-to-create-development-branch-from-master-on-github)  
[GitHub: Support for password authentication was removed | How to use a personal access token](https://youtu.be/g8M5QsuVYP8)  
[Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and
[Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)  
[README: Insert graphics](https://github.com/minhhoangp/graphics/blob/master/README.md)  
[GitHub the right way using the 'gh' utility](https://christitus.com/using-github-correctly/)  

### Creating a git develop branch
You can list all of your current branches like this:
```
git branch -a
```
This shows all of the local and remote branches. Assuming you only have a single `main` branch, you'd see the following:
```
* main
  remotes/origin/main
```
The `*` means the current branch.

Show commit logs:
```
# detailed
git log
# outputs reduced to a single line - helps with huge numbers of logs
git log --oneline
```

To create a new branch named develop, use the following command:
```
git checkout -b develop
```
The `-b` flag creates the branch. Listing the branches now should show:
```
* develop
  main
  remotes/origin/main
```

### Changing branches
You shouldn't commit anything directly to the `main` branch. Instead do all your work on the `develop` branch and then merge `develop` into main whenever you have a new public release.  
You are already in your develop branch, but if you weren't, the way to switch is as follows:
```
git checkout develop
```
That's the same way you create a branch but without the `-b`.

### Making changes on develop
When making changes, add and commit as usual:
```
git add .
git commit -m "whatever"
```
The first time you push to your remote do it like so:
```
git push -u origin develop
```
The `-u` flag stands for `--set-upstream`. After the first time you only need to do it like this:
```
git push
```

### Merging develop to main
Once your `develop` is ready to merge into `main` you can do it like so:  
First switch to your local main branch:
```
git checkout main
```
To merge develop into main do the following:
```
git merge develop
```
Then push the changes in local main to the remote main:
```
git push
```
Done.

### Deleting a branch
If you don't need the `develop` branch anymore, or you just want to delete it and start over, you can do the following:  
Delete the remote develop branch:
```
git push -d origin develop
```
Then delete the local branch:
```
git branch -d develop
```
The `-d` means delete.


### About .gitignore
https://stackoverflow.com/questions/8021441/how-to-ignore-all-hidden-directories-files-recursively-in-a-git-repository  

With the gitignore file you can tell git to only push those files that you want it to. Temporary files are usually unimportant and will only fill up your repository with rubbish.  
But:  
.gitignore will only effect files that haven't been 'added' already.  

To make new .gitignore entries affect all files
1. Make changes to .gitignore
2. `git commit -a -m "Pre .gitignore changes"`
3. `git rm -r --cached .`
4. `git add .`
5. `git commit -a -m "Post .gitignore changes"`
6. `git status` should output "nothing to commit (working directory clean)"

For Example one configuration might look like this:
```
# Python
__pycache__/
*.py[cod]

# Audio
*.wav
*.mp3
*.wma

# All hidden files (on Mac, Linux and Unix)
.*

# except these files
!.gitignore
```
When creating a new repository, Github will even ask you whether you want to choose from a gitignore template. Very helpful!

More Examples:
```
# Compiled source #
###################
*.com
*.class
*.dll
*.exe
*.o
*.so
*.bak
*.swp

# Packages #
############
# it's better to unpack these files and commit the raw source
# git has its own built in compression methods
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# Logs and databases #
######################
*.log
*.sql
*.sqlite

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
desktop.ini
*~
*.save
*.*~
project.lock.json

# Images #
##########
*.png
*.jpg
*.jpeg
*.gif
*.bmp
*.svg
*.ico
*.psd
*.xcf

*.ai
*.eps

# Video #
#########
*.wmv
*.mpg
*.mpeg
*.mp4
*.mov
*.flv
*.avi
*.ogv
*.webm

# Audio #
#########
*.wav
*.mp3
*.wma
*.ogg
*.m4a

# Fonts #
#########
*.eot
*.ttf
*.woff

# IDE (eclipse/intellij) #
##########################
.classpath
.project
.settings
nbproject
.~lock.*
.buildpath
.idea
.metadata
*.iml
*.ipr
composer.lock

# Visual Studio Code
.vscode

# Visual Studio 2015
.vs/

#     Python     #
##################
__pycache__/
*.py[cod]

#      Rust      #
##################
/target

#      C#        #
##################
# User-specific files
*.suo
*.user
*.userosscache
*.sln.docstates

# Build results
[Dd]ebug/
[Dd]ebugPublic/
[Rr]elease/
[Rr]eleases/
x64/
x86/
build/
bld/
[Bb]in/
[Oo]bj/
msbuild.log
msbuild.err
msbuild.wrn

# TexMaker LaTeX #
##################
*.pyg
*.aux
*.toc
*.lof
*.lol
*.out
```
