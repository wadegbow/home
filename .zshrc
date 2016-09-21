#-----------------#
#  Install Stuff  #
#-----------------#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
autoload -Uz promptinit
promptinit
prompt paradox

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

#RTV
export PAGER=less
export RTV_EDITOR=vim


#----------#
#  Custom  # 
#----------#

# Basic Stuff
alias ls="ls --color"
alias lsf="ls --color | grep"
alias edit="subl -n"
alias subl="subl -n"
alias src="source ~/.zshrc"
alias open.=" open ."
alias cl="clear"
alias cp="rsync -ahv --progress"
alias filecount="ls -l | wc -l"

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Show/Hide Hidden Files
alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"
alias hideIcons="defaults write com.apple.finder CreateDesktop -bool false; killall Finder"
alias showIcons="defaults write com.apple.finder CreateDesktop -bool true; killall Finder"

# python
# alias python=/usr/local/opt/python/bin/python2.7
# alias python2.7=/usr/local/opt/python/bin/python2.7

# Networking
alias lanip="ifconfig | grep 'inet 192.168'"
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias mkhttp="python3 -m http.server"

# Compiling
alias compA='g++ -g -Wall -std=c++11 *.cpp *.h'
alias comp='g++ -g -Wall -std=c++11'

# Todo/Notes
alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -d $HOME/Dropbox/notes/todo.cfg'
alias tedit='subl -n ~/Dropbox/notes/todo.txt'
alias notes="subl -n ~/Dropbox/notes"

# Misc
alias elited="cd /Users/wade/Library/Application\ Support/Frontier\ Developments/Elite\ Dangerous/Options/"
alias streamflix="/Applications/streamflix/bin/streamflix"
alias synirc="irssi -c irc.synirc.net"
alias ytdlmp3="youtube-dl --add-metadata -x --audio-format 'mp3' --audio-quality 0"
alias mpv="mpv --no-border"
alias mpvpip="mpv --ontop --no-border --on-all-workspaces --autofit=384x216 --geometry=99%:2%"
alias colors="python ~/Scripts/colors.py -t"
alias get_embed="python ~/scripts/scrape-sa.py"
alias archey="archey -c"
alias imgburn="cdrdao write --device 'IOService:/AppleACPIPlatformExpert/PCI0@0/AppleACPIPCI/XHC1@14/XHC1@14000000/PRT2@14200000/MacBook Air SuperDrive@14200000/IOUSBHostInterface@0/IOUSBMassStorageInterfaceNub/IOUSBMassStorageDriverNub/com_apple_driver_AppleUSBODD/IOSCSILogicalUnitNub@0/com_apple_driver_AppleUSBODDType05/IODVDServices' --driver generic-mmc"
alias musik="mpd && mpdscribble && ncmpcpp"
alias mame="mame64"
alias vim="nvim"


#-------------#
#  Functions  #
#-------------#

# Twitch
function twitch () {
    #shopt -s expand_aliases
    livestreamer twitch.tv/$1 $2 -p 'mpv --no-border'    
}

# CSE Directory
function cse () {
    cd "/Users/wade/Google Drive/school/CSE"$1
}

# ROCKMAN Directory
function rockman () {
    cd "/Volumes/ROCKMAN/"$1
}

# 4Chan Downloader
function 4get () {
    wget -H -A $1 -rc -Di.4cdn.org -erobots=off $2
}

# make music directories
function mkalb () {
    mkdir "[$1] $2"
}

# print a separator banner, as wide as the terminal
function hr {
    print ${(l:COLUMNS::=:)}
}
export NVM_DIR="/Users/wade/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f ~/.zshrc ]; then nvm use stable; fi

#example of command on terminal start
#if [ -f ~/.zshrc ]; then
#   nvm use stable
#fi
