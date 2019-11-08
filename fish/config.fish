### fish

set fish_greeting ""

# source all of the files in the function directory
for f in ~/.config/fish/functions/*.fish
  . $f
end


### general

# vim and some other things rely on SHELL being a posixy sh this may cause
# problems in the future, in which case I'll define a little function to wrap
# vim and give it a fake environment variable.
set -x SHELL (which sh)

set -x EDITOR "code -w"
set -x REACT_EDITOR code

# This env var is used by e.g. the various Podfiles to either pull in OSS or
# closed source libs.
set -x ARTSY_STAFF_MEMBER "1"

### Ruby

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

set -x GEM_HOME $HOME/.gem
set PATH $GEM_HOME/bin $PATH

function be
  bundle exec $argv
end

function bi
  bundle install
end

function bu
  bundle update
end

source ~/.config/fish/credentials.fish

# Use https://hub.github.com as if it were git
eval (hub alias -s)
source /usr/local/share/fish/vendor_completions.d/hub.fish

# Setup Node version manager
source ~/.config/fish/nvm-wrapper/nvm.fish
nvm use default 2>&1 >/dev/null

set PATH ./bin $PATH