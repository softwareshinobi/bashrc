#!/bin/bash
set -e

# Target system-wide profile directory
TARGET_FILE="/etc/profile.d/softwareshinobi.bashrc.sh"

# Create script with your functions and aliases
cat << 'EOF' > "$TARGET_FILE"
#!/bin/bash

# Custom Functions
stop() {
    docker stop $(docker ps -a -q)
}

# Custom Aliases
alias prune="set -e;reset;clear;docker system prune -a -f;docker volume prune -a -f;"
alias r="reset;clear;"
alias push="reset;clear;git add .;git commit -m 'automated terminal push';git push origin;"
alias pushe="reset;clear;git add .;git commit -m 'automated terminal push';git push origin;exit"

alias d="docker"
alias c="docker compose"
alias compose='docker compose'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../path/../../..'

alias @memory-info='free -m -l -t'
alias @memory-top='ps auxf | sort -nr -k 4 | head -10'
alias @memory-top-10='ps auxf | sort -nr -k 4 | head -10'

alias @cpu-info='lscpu'
alias @cpu-top='ps auxf | sort -nr -k 3'
alias @cpu-top-10='ps auxf | sort -nr -k 3 | head -10'

alias @net-open-ports="sudo netstat -tlpn"
alias @net-external-ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias @net-internal-interfaces="dig +short myip.opendns.com @resolver1.opendns.com"
EOF

chmod 644 "$TARGET_FILE"
echo "System-wide aliases installed to $TARGET_FILE"
