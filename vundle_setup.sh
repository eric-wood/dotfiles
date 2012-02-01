#! /bin/bash

REPO_PATH="$HOME/git/dotfiles"

# Pull down the vundle shenanigans
rm -rf ~/.vim/bundle/vundle
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Install all bundles
vim +BundleInstall +qall

# Some submodules have stupid stupid setups without a proper .gitignore
# We'll go ahead and add some to get them to shut up
for dir in `ls -1 $REPO_PATH/.vim/bundle`
do
  cd "$REPO_PATH/.vim/bundle/$dir"
  echo "doc/tags" >> ".gitignore"
  git add -A
  git commit -m "Appended to .gitignore"
  cd -
done

