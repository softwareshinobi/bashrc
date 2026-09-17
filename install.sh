#!/bin/bash
set -e

# Target system-wide profile directory
TARGET_FILE="/etc/profile.d/softwareshinobi.bashrc.sh"

# Create script with your functions and aliases
cat << 'EOF' > "$TARGET_FILE"
#!/bin/bash

# Custom Functions

function export_repo() {

    local directory="."
    local output_file="${1:-./repo-export.dat}"

    echo "Exporting repository: ${directory}"
    echo "Output file: ${output_file}"

    # Start with an empty export file.
    : > "${output_file}"

    # Traverse the complete directory tree and concatenate every file.
    find "${directory}" \
        \( -type d \( -name ".git" -o -name ".recycle" -o -name ".idea" -o -name ".templater" \) -prune \) \
        -o \( -type f -print0 \) |
    while IFS= read -r -d '' file; do
        echo "==================================================" >> "${output_file}"
        echo "FILE: ${file}" >> "${output_file}"
        echo "==================================================" >> "${output_file}"

        cat "${file}" >> "${output_file}"

        printf '\n\n' >> "${output_file}"
    done

    echo "Repository export complete."
}
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
