# Set PATH
set -x PATH $PATH ~/bin


#atuin
atuin init fish | source

#zoxide
zoxide init fish | source
# Only run the following in interactive sessions
if status is-interactive
    clear
    fastfetch

    # Initialize Starship prompt
    starship init fish | source

    # Function for Yazi (file manager)
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"

        set cwd (cat "$tmp")
        if test -n "$cwd" && test "$cwd" != "$PWD"
            cd "$cwd"
        end

        rm -f "$tmp"
    end
end


#Abbreviations
abbr -a n "nvim"
abbr -a reb "sudo nixos-rebuild test"
abbr -a rebs "sudo nixos-rebuild switch"
abbr -a ga "git add ."
abbr -a gs "git status"
abbr -a gp "git push"
abbr -a conf "sudo nvim /etc/nixos/configuration.nix"
abbr -a ai "sudo systemctl start ollama.service"
abbr -a ais "sudo systemctl stop ollama.service"
abbr -a qwen "ollama run qwen2.5-coder:1.5b"
abbr -a gm "git commit -m"
abbr -a shell "nix-shell"
abbr -a py "python3"
abbr -a bluetooth "python3 ~/Programming/python/pyscripts/bluetooth.py" 



#direnv
eval (direnv hook fish)
