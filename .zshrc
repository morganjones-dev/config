source ~/.cache/wal/colors-tty.sh
source ~/.zfunc

[[ "$(tty)" == "/dev/tty1" ]] && start-hyprland
[[ "$TERM" == "xterm-kitty" ]] && pfetch
PROMPT="%B[%m %3~]%b "

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec


