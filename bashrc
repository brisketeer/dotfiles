USER_HOME="/Users/dlantner_mac"
export PANOPTICON_HOME=$USER_HOME/panopticon

alias ll='ls -alFG'
function cdl() { cd $1; ls -alFrt .; }

alias nb-graph='cd ~/cloud/narc/narc-backend/src/main/java/com/texeltek/narc/graph'
alias nwo-tools='cd ~/cloud/narc/narc-webservice-old/src/main/java/com/texeltek/tools'
alias nn='cd ~/cloud/narc/narc-webservice' 
alias rhino='java -jar /Users/dlantner_mac/rhino/rhino1_7R2/js.jar'

alias gt='grails test-app'
alias gi='grails test-app -integration'
alias gu='grails test-app -unit'

alias sqlplus='rlwrap sqlplus'

alias trhi='open test/reports/html/index.html'
alias iml='git co -- $PANOPTICON_HOME/*.iml'

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"

JAVA_OPTS_PLAIN="-Xmx1024M -XX:MaxPermSize=512M -XX:+CMSClassUnloadingEnabled -Duser.timezone=UTC"
JAVA_OPTS_DEBUG="-Xmx1024M -XX:MaxPermSize=512M -XX:+CMSClassUnloadingEnabled -Duser.timezone=UTC -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"

function debug-on() { export JAVA_OPTS=$JAVA_OPTS_DEBUG; export JAVA_OPTIONS=$JAVA_OPTS; }
function debug-off() { export JAVA_OPTS=$JAVA_OPTS_PLAIN; export JAVA_OPTIONS=$JAVA_OPTS; }

export JAVA_OPTS=$JAVA_OPTS_PLAIN
export JAVA_OPTIONS=$JAVA_OPTS
export GROOVY_HOME=/Library/Groovy/Home
export GRAILS_HOME=/Library/Grails/Home

export HADOOP_HOME=/opt/hadoop
export ZOOKEEPER_HOME=/opt/zookeeper
export OOZIE_HOME=/opt/oozie
export NARC_YAML=$USER_HOME/cloud/config

export MAVEN_OPTS=-Xmx1024m

export ORACLE_HOME=/Library/Oracle
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$ORACLE_HOME
export TNS_ADMIN=$ORACLE_HOME
export ORACLE_IP="192.168.157.129"

function update-config() {
    cp $PANOPTICON_HOME/conf-raw/PanopticonConfigTemplate.groovy $USER_HOME/.grails/PanopticonConfig.groovy
    perl -pi -e 's/JSTONEHAM/DLANTNER/g' $USER_HOME/.grails/PanopticonConfig.groovy
}

#helper functions for switching grails/groovy versions
function set-grails-version() { rm -f /Library/Grails/Home; ln -s /Library/Grails/grails-$1 /Library/Grails/Home; }
function set-groovy-version() { rm -f /Library/Groovy/Home; ln -s /Library/Groovy/groovy-$1 /Library/Groovy/Home; }

# bash completion for git command line display
. /etc/bash_completion
for f in "/etc/bash_completion.d/*"; do
    . $f
done

function gitbranch() {
    git co -b $2 $1;
    git push mainline $2:private/dan/$2;
    git co $1;
    git branch -D $2;
    git checkout -b $2 mainline/private/dan/$2;
}

function clean-grails() {
    rm -rf $USER_HOME/.grails/1.2.2;
}

export GIT_PS1_SHOWDIRTYSTATE=true
source $USER_HOME/panopticon/misc/grails-completion.bash

export PATH=$USER_HOME/bin:/usr/local/mysql/bin:/usr/local/rlwrap/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$PATH:$ORACLE_HOME:/opt/hadoop/bin

[[ -s "$USER_HOME/.rvm/scripts/rvm" ]] && source "$USER_HOME/.rvm/scripts/rvm"

# append history to file, so commands executed in one terminal show up in the history of another terminal
shopt -s histappend
PROMPT_COMMAND='history -a'
# ignore common misspelling like cd /otp instead of cd /opt
shopt -s cdspell
# don't add duplicate entries to your hisotry
export HISTCONTROL="ignoredups"
# don't add common commands to the history file
export HISTIGNORE="&:ls:[bf]g:exit"
# fix multiline commands so they are correct in the history
shopt -s cmdhist

# bash color refs:
# ---------------------------------------
# Black       0;30     Dark Gray     1;30
# Red         0;31     Light Red     1;31
# Green       0;32     Light Green   1;32
# Brown       0;33     Yellow        1;33
# Blue        0;34     Light Blue    1;34
# Purple      0;35     Light Purple  1;35
# Cyan        0;36     Light Cyan    1;36
# Light Gray  0;37     White         1;37

#change the prompt and the coloring
# export PS1='\n\n\[\e[1;37m\][\A] [\w]\[\e[0m\]$(__git_ps1 "(%s)") \$>'
export PS1='\n\n[\A] \[\e[0;36m\e[40m\][\w]\[\e[0m\e[0m\] \[\e[1;37m\]$(__git_ps1 "(%s)")\[\e[0m\] \$>'

# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# A     bold black, usually shows up as dark grey
# B     bold red
# C     bold green
# D     bold brown, usually shows up as yellow
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background

# 1.   directory
# 2.   symbolic link
# 3.   socket
# 4.   pipe
# 5.   executable
# 6.   block special
# 7.   character special
# 8.   executable with setuid bit set
# 9.   executable with setgid bit set
# 10.  directory writable to others, with sticky bit
# 11.  directory writable to others, without sticky bit

export LSCOLORS=gxfxcxdxbxegedabagacad
