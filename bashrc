#TODO: auto completion
function cdr { cd ~/gitr/$1; }
function cdw { cd ~/work/$1; }
function cdp { cd ~/projects/$1; }
function rr { ripl-rails; }
function rrc { richrc; }
function rrr { ripl rc rails; }

function railsapp {
  appname=$1
  shift 1
  rails new $appname -m ~/.rails-templates/base.rb $@
}

if [ -d ~/.ec2 ]; then
  export EC2_HOME=~/.ec2
  export PATH=$PATH:$EC2_HOME/bin
  export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
  export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
  #TODO: JAVA_HOME
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
fi

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
  echo "("${ref#refs/heads/}") ";
}

PS1="[\[\033[1;32m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(parse_git_branch)\[\033[0m\]$ "

if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Todo: extract PATH to localrc
PATH=$PATH:/usr/local/Cellar/python/2.7.1/bin/:~/gitr/m17/bin:~/.bin
alias mate='open -a TextMate.app'
export EDITOR=vim

source ~/.bash/completions/git_completion

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# export NODE_PATH=/usr/local/lib/node to your NODE_PATH
