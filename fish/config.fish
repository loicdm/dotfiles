if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    source ~/.ssh/ssh-agent.env.fish
end
