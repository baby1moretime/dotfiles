# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Add JAVA_HOME to $PATH
export JAVA_HOME=/usr

# Adding Pig location to PATH
export PATH="$HOME/Softwares/Pig/pig-0.11.0/bin:$PATH"

# Setting PATH for EPD_free-7.3-1
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH"

# Setting PATH for htdocs
export PATH="/Applications/XAMPP/xamppfiles/htdocs/:$PATH"

# Setting PATH to s3cmd
export PATH="/Users/Shreyas/Documents/_WorkSpace/AWS/S3/s3cmd-1.5.0-alpha1:$PATH"

# for iRODS command line tools
export PATH="/Users/Shreyas/Documents/_Berkeley/summer/digging_into_data/iRods/_packages/iRODS/clients/icommands/bin:$PATH"

# for R Studio
export TERM=xterm-color

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion