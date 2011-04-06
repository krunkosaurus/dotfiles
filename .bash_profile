alias e=/Applications/Emacs.app;export e;
# irc port fowarding for work around when i'm tethered
alias irc='ssh -vD 6667 sadbot'

# used to reattach ssh forwarding to "stale" tmux sessions 
# http://justinchouinard.com/blog/2010/04/10/fix-stale-ssh-environment-variables-in-gnu-screen-and-tmux/
function r() {
  if [[ -n $TMUX ]]; then
    NEW_SSH_AUTH_SOCK=`tmux showenv|grep ^SSH_AUTH_SOCK|cut -d = -f 2`
    if [[ -n $NEW_SSH_AUTH_SOCK ]] && [[ -S $NEW_SSH_AUTH_SOCK ]]; then
      SSH_AUTH_SOCK=$NEW_SSH_AUTH_SOCK
    fi
  fi
}

alias tmls='tmux ls'
function tma (){
    tmux attach -t $1
}

function dp {
    P=`pwd`
    cd ~/.dotfiles/
    git commit -av
    git push
    cd $P
}
function df {
    P=`pwd`
    cd ~/.dotfiles/
    git pull
    cd $P
}
function ds {
    P=`pwd`
    cd ~/.dotfiles/
    git diff
    cd $P
}

EVENT_NOKQUEUE=1
# To use PWD should be inside an artist folder in itunes to share a spec album
function ship {
    STARTTIME=$(date +%s)
    ARTIST=`pwd | sed 's_/.*/__g'`
    DATE=`ls "$1"/01* | xargs echo -n | xargs -0 id3tool | grep -oE [0-9]\{4\}`
    ZIPTITLE="$ARTIST - $1"
	if [ -n "$DATE" ]; then
	    ZIPTITLE="$ZIPTITLE ($DATE)"
	fi
    # Using 0% compression since the time it takes only saves 3% for mp3s
    zip -vr0 "$ZIPTITLE" "$1"
    echo 'total zip time:' $(( $(date +%s) - $STARTTIME )) 'seconds.'
    echo 'Created file:' \'$ZIPTITLE'.zip'\'

    # ship it
    rsync -h --progress  "$ZIPTITLE".zip krunkosaurus@97.107.138.158:/html/sadbot.com/jawili/albums/

    echo 'Transfer Complete.'
    #read -p "Delete zip? (y/n)?"
    #[ "$REPLY" == "n" ] || 
	rm "$ZIPTITLE".zip
    echo 'total time:' $(( $(date +%s) - $STARTTIME )) 'seconds.'
}

#for syncing js from dream to qa and pro
function c {
    ssh readystate4.com "cd readystate4.com/ws/;. tools/concat.sh;. tools/updateallrevs.sh"
}

#for livepress
alias o="ssh -vR 8081:localhost:8081 krunkosaurus@sadbot.com"

function diffwidgets {
       ssh krunkosaurus.com "cd readystate4.com;cd ws;git diff" | mate;
}

function diffnewdev {
       ssh mauvis@newdev.tapulous.com "cd server;git diff" | mate;
}

function grepmod (){
        if [ $2 ]
        then
                grep -nr "$1" --color=auto --include=*.$2 .
        else
                grep -nr "$1" --color=auto --include=*.{tpl,mod,php,conf,api,js,css} .
        fi
}

PS1='[\$\h - \@ - \w]$ '

function rs {
	rsync -zrpthP $@
}

function diffm {

	diff -wb  --normal $1 ../../kickapps_4_3_9/kickapps/$1 | mate

}

alias flush="dscacheutil -flushcache"
alias gs='git status'
alias gul='git pull'
alias gush='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gitlog='git log --since="2 weeks ago" --date="relative" --stat'
alias gitlogme='git log --date=relative --stat --author="Mauvis"'
alias glp='git log --date="relative" -p'
alias sv='svn log -r HEAD:BASE -v  | more'
alias ip='ifconfig | grep "inet 192"'
alias pro='emacs ~/.dotfiles/.bash_profile'
alias repro='. ~/.dotfiles/.bash_profile'
alias conf='mate /Applications/MAMP/conf/apache/httpd.conf'
alias etc='sudo nano /etc/hosts'

alias cdo='cd ~/Dropbox/bin/org'
alias cdg='cd ~/Documents/git'
alias cds='cd ~/Documents/svn'
alias cdscripts='cd ~/Dropbox/scripts/'

alias sockme='sudo ssh -vD 443  mauvis@76.15.186.96'
alias sockmedream='sudo ssh -vD 443  krunkosaurus@readystate4.com'
alias sockmeknode='sudo ssh -vD 443  krunkosaurus@97.107.138.158'
alias sup='svn update'
alias ss='svn status'
alias sin='svn info'

function ttfb {
        curl -o /dev/null -w "Connect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n" $1
}

function sd {
	svn diff -x --ignore-eol-style $1 | mate
}

function sl {
	if [ -z $1 ]
	then
	    svn -v log | less
	else
	    svn -vl 50 log . | grep -A 5 $1 | more
	fi
}

function sc {
	svn commit $@
}


##
# Your previous /Users/krunkosaurus/.bash_profile file was backed up as /Users/krunkosaurus/.bash_profile.macports-saved_2010-12-22_at_12:04:20
##

# MacPorts Installer addition on 2010-12-22_at_12:04:20: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

