PROMPT="%B[%m %3~]%b "

export NVM_DIR="$HOME/.nvm"
export DOTS_DIR="$HOME/.dots"
[[ ! -d "$DOTS_DIR" ]] && echo "DOTS_DIR \"$DOTS_DIR\" does not exist."

# Source files
file="$HOME/.cachhe/wal/colours-tty.sh" && [[ -f "$file" ]] && source "$file"
file="$DOTS_DIR/.zfunc" && [[ -f "$file" ]] && source "$file"
file="$DOTS_DIR/.zaliases" && [[ -f "$file" ]] && source "$file"

# Initialize NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Autostart
[[ "$TTY" == "/dev/tty1" ]] && start-hyprland
[[ "$TERM" == "xterm-kitty" ]] && pfetch

# PATH
path+=("$HOME/.android/sdk/platform-tools/")
