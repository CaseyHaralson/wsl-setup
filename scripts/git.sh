#!/bin/sh

echo "=================================="
echo "Git setup ..."
echo "=================================="

# setup user.name
GIT_USERNAME=`git config --list | grep user.name`
if [ -z "$GIT_USERNAME" ]; then
  echo "The git user.name isn't set. What is your name?"
  read GIT_USERNAME
  if [ -z "$GIT_USERNAME" ]; then return 1; fi
  git config --global user.name "$GIT_USERNAME"
fi

# setup user.email
GIT_USEREMAIL=`git config --list | grep user.email`
if [ -z "$GIT_USEREMAIL" ]; then
  echo "The git user.email isn't set. What is your email?"
  read GIT_USEREMAIL
  if [ -z "$GIT_USEREMAIL" ]; then return 1; fi
  git config --global user.email "$GIT_USEREMAIL"
fi

# setup default branch
GIT_DEFAULTBRANCH=`git config --list | grep init.defaultbranch`
if [ -z "$GIT_DEFAULTBRANCH" ]; then
  echo "The git init.defaultbranch isn't set. Setting it to 'main'."
  git config --global init.defaultbranch "main"
fi

# setup pull rebase
GIT_PULLREBASE=`git config --list | grep pull.rebase`
if [ -z "$GIT_PULLREBASE" ]; then
  echo "The git pull.rebase isn't set. Setting it to 'false'."
  git config --global pull.rebase "false"
fi
