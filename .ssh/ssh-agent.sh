#!/usr/bin/bash
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -a ${HOME}/.ssh/ssh-agent.socket > "${HOME}/.ssh/ssh-agent.env"
fi

if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "${HOME}/.ssh/ssh-agent.env" >/dev/null
    echo "set -e SSH_AUTH_SOCK; set -x -U SSH_AUTH_SOCK ${SSH_AUTH_SOCK};" > "$HOME/.ssh/ssh-agent.env.fish"
    echo "set -e SSH_AGENT_PID; set -x -U SSH_AGENT_PID ${SSH_AGENT_PID};" >> "$HOME/.ssh/ssh-agent.env.fish"
fi
