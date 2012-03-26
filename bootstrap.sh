shopt -s dotglob # We want to glob dotfiles!

# Symlink everything from here to whatever the current homedir is
function preserve_stuff
{
	if [ -h ~/$1 ]; then
		echo "~/$1 already exists, removing symlink"
		rm ~/$1
	elif [ -a ~/$1 ]; then
		echo "~/$1 already exists, moving to: ~/$1_old"
		mv ~/$1 ~/$1_old
	fi
	ln -s $PWD/$1 ~/$1
}

# Glob all dotfiles with a few exceptions
# Now I don't have to update this script much in the future!
#preserve_stuff !(.git|.gitignore|*.swp|README.md|bootstrap.sh|.bash_shenanigans|.irssi)
preserve_stuff .screenrc
preserve_stuff .tmux.conf
preserve_stuff .vim
preserve_stuff .vimrc
preserve_stuff .gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# irssi stuff is a different matter, though
preserve_stuff .irssi/config
preserve_stuff .irssi/scripts

# Now for the magic where I append my bash stuff onto 
# the existing bash_profile without causing problems (in theory...)
if ! cat ~/.bash_profile | grep -q ". $PWD/bash_shenanigans.sh"
then
	echo "Appending .bash_shenanigans to ~/.bash_profile"
	echo ". $PWD/.bash_shenanigans" >> ~/.bash_profile
fi

echo "Setting up Vim and installing Vundle stuffs..."
mkdir ~/.vim_swap
. vundle_setup.sh

