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
PS1="[\[\033[1;32m\]\w\[\033[0m] \[\033[0m\]\[\033[1;36m\]\$(parse_git_branch)\[\033[0m\]$ "

if [[ -s /Users/ycling/.rvm/scripts/rvm ]] ; then source /Users/ycling/.rvm/scripts/rvm ; fi

# Todo: extract PATH to localrc
PATH=$PATH:/usr/local/Cellar/python/2.7.1/bin/:~/gitr/m17/bin
alias mate='open -a TextMate.app'
export EDITOR=gvim

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
