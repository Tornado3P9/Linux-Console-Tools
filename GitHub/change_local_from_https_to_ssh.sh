#/bin/bash
# https://gist.github.com/m14t/3056747
#-- Script to automate https://help.github.com/articles/why-is-git-always-asking-for-my-password
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories

REPO_URL=`git remote -v | grep -m1 '^origin' | sed -Ene's#.*(https://[^[:space:]]*).*#\1#p'`
if [ -z "$REPO_URL" ]; then
  echo "-- ERROR:  Could not identify Repo url."
  echo "   It is possible this repo is already using SSH instead of HTTPS."
  exit
fi

GITUSER=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\1#p'`
if [ -z "$GITUSER" ]; then
  echo "-- ERROR:  Could not identify Github User."
  exit
fi

REPO=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\2#p'`
if [ -z "$REPO" ]; then
  echo "-- ERROR:  Could not identify Repo."
  exit
fi

NEW_URL="git@github.com:$GITUSER/$REPO.git"
echo "Changing repo url from "
echo "  '$REPO_URL'"
echo "      to "
echo "  '$NEW_URL'"
echo ""

CHANGE_CMD="git remote set-url origin $NEW_URL"
`$CHANGE_CMD`

echo "Success"



### Or use this version:
# You can get your $NEW_URL by just logging in to your Github account and copying the link.
# Click on the green 'Code' button and then on SSH and then copy the new URL.
# Or if you know your Github username and your repository name (which I hope you do)
# then just use a single liner by typing: git remote set-url origin git@github.com:username/repo-name-here.git



### Or use this version from https://gist.github.com/shivams
#HTTPS to SSH,works for any repository (Github, Gitlab, Bitbucket or private Git server):
#The if condition is for checking your remote HTTPS URL has `.git` at the end or not

#if git config --get remote.origin.url | grep -P '\.git$' >/dev/null; then 
#    newURL=`git config --get remote.origin.url | sed -r 's#(http.*://)([^/]+)/(.+)$#git@\2:\3#g'`
#else
#    newURL=`git config --get remote.origin.url | sed -r 's#(http.*://)([^/]+)/(.+)$#git@\2:\3.git#g'`
#fi;
#
#echo "Does this new url look fine? (y/n) : " $newURL
#read response
#if [[ "$response" == "y" ]]; then 
#    git remote set-url origin $newURL; 
#    echo "Git remote updated."; 
#else 
#    echo "Git remote unchanged."; 
#fi;
