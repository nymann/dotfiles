alias sus="systemctl --user status"

alias v="nvim"
alias nymann="cd ~/code/github.com/nymann"
alias wert="cd ~/code/github.com/wert-dk/api"
alias kruhlmann="cd ~/code/github.com/kruhlmann"
alias creditoro="cd ~/code/github.com/creditoro"
alias github="cd ~/code/github.com"
alias ydl="youtube-dl -o \"%(title)s.%(ext)s\"" 
alias yt="youtube-dl --add-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias pykpi="cd ~/code/mo-gitlab.siemens.dk/sw-group/banedanmark/s-bane/pykpi/"
alias tlog="cd ~/code/mo-gitlab.siemens.dk/sw-group/banedanmark/s-bane/pykpi/tlog/components/api && source venv/bin/activate"
alias chessdb="cd ~/code/github.com/chessdb/api && source venv/bin/activate"
alias sdn="shutdown_warning_card_inserted"
alias todo="calcurse -Q --filter-type todo --filter-uncompleted"
alias dotfiles="cd ~/code/github.com/nymann/dotfiles/dots"
alias sv="sudo -E nvim"
alias sysu="systemctl --user"
alias ju="journalctl --user"
alias unlock="pass mutt-wizard-siemens"
alias scd2ldap="ldapsearch -x -H ldap://scd2ldap.siemens.net:389 "
alias stp="~/code/mo-gitlab.siemens.dk/student-talent-pool/"
alias mo="~/code/mo-gitlab.siemens.dk/"
alias colemak="setxkbmap -variant colemak"
alias kb="setxkbmap -variant altgr-intl"
alias senv="source .venv/bin/activate"
alias cenv="python3 -m venv .venv && senv"
alias ealiases="v ~/.config/zsh/custom/aliases.zsh"
alias edwm="v ~/code/github.com/nymann/dotfiles/dots/dwm/config.h"
alias devops="~/code/mo-gitlab.siemens.dk/devops"
alias itd="python3 -c \"import configparser; c = configparser.ConfigParser(); c.read('setup.cfg'); print(c['options']['tests_require'])\" | xargs pip install"
alias gp="git push"
alias tlog_data="python3 __init__.py --database=tlog --days=1000 --per_day=15000 --table=aktv"
alias lint="pylint --rcfile=setup.cfg src migrations tests"
alias fix="isort --recursive src migrations tests;yapf --style google -ipr src migrations tests"
alias test="python3 setup.py test"
alias p="cat"
alias commit="emoji_commit_selector"
