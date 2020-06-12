#!/bin/bash

PROMPT='[bootstrap]'
# TODO : Delete symlinks to deleted files
# Is this where rsync shines?
# TODO - add support for -f and --force

DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
USER_HOME=$HOME
link () {
	echo "$PROMPT This utility will symlink the files in this repo to the home directory"
	echo "$PROMPT Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A $DIR | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|.config' ) ; do
			sudo ln -svf $DIR/$file "$USER_HOME"
		done

		for file in $( ls -A $DIR/.config ) ; do
			sudo ln -svf $DIR/.config/$file "$USER_HOME"/.config
		done
		# TODO: source files here?
		echo "$PROMPT Symlinking complete"
	else
		echo "$PROMPT Symlinking cancelled by user"
		return 1
	fi
}

install_tools () {
	case "$(uname -s)" in
		Darwin)
			echo "$PROMPT Detected macOS"
			echo "$PROMPT This utility will install useful utilities using Homebrew"
			echo "$PROMPT Proceed? (y/n)"
			read resp
			# TODO - regex here?
			if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
				echo "$PROMPT Installing useful stuff using brew. This may take a while..."
				sh $DIR/brew.exclude.sh
			else
				echo "$PROMPT Brew installation cancelled by user"
			fi
			;;
		Linux)
			echo "$PROMPT Detected Linux"
			echo "$PROMPT This utility will install useful utilities using apt (this has been tested on Debian buster)"
			echo "$PROMPT Proceed? (y/n)"
			read resp
			# TODO - regex here?
			if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
				echo "$PROMPT Installing useful stuff using apt. This may take a while..."
				sh $DIR/apt.exclude.sh
			else
				echo "$PROMPT Apt installation cancelled by user"
			fi
			;;
	esac
}

link
install_tools
zsh && source ~/.zshrc
