if status is-interactive
#ide configure --auto --style=Classic --prompt_colors='16 colors' --show_time='24-hour format' --classic_prompt_separators=Round --powerline_prompt_heads=Sharp --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Disconnected --powerline_right_prompt_frame=No --prompt_spacing=Sparse --icons='Many icons' --transient=Yes

    export EDITOR="nvim"
    set PATH $PATH ~/.cargo/bin ~/.local/bin

	alias ls          'eza --color --icons'
    alias clp         'xclip -selection clipboard'
    alias dotfiles    '/usr/bin/git --git-dir="$HOME/.dotfiles/.git" \
                                    --work-tree="$HOME/.dotfiles/"'
    zoxide init fish | source
    #atuin init fish | source

    set fish_greeting
	~/ufetch-main/ufetch-arch
    Taskir list today
	Taskir list -Y
	echo ""
end
