PROMPT="%B[%m %3~]%b "

export NVM_HOME="$HOME/.nvm"
export NVM_DIR="/usr/share/nvm"
export DOTS_DIR="$HOME/.dots"
[[ ! -d "$DOTS_DIR" ]] && echo "DOTS_DIR \"$DOTS_DIR\" does not exist."

# Source files
file="$HOME/.cachhe/wal/colours-tty.sh" && [[ -f "$file" ]] && source "$file"
file="$DOTS_DIR/.zfunc" && [[ -f "$file" ]] && source "$file"
file="$DOTS_DIR/.zaliases" && [[ -f "$file" ]] && source "$file"

file="$NVM_DIR/nvm.sh" && [[ -f "$file" ]] && source "$file"
file="$NVM_DIR/bash_completion" && [[ -f "$file" ]] && source "$file"
file="$NVM_DIR/install-nvm-exec" && [[ -f "$file" ]] && source "$file"

# Autostart
[[ "$TTY" == "/dev/tty1" ]] && start-hyprland
[[ "$TERM" == "xterm-kitty" ]] && pfetch

# PATH
path+=("$HOME/.android/sdk/platform-tools/")
