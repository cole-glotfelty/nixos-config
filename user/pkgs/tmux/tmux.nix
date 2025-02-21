{ ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    prefix = "C-a";
    baseIndex = 1;
    terminal = "screen-256color";
    extraConfig = ''
      set -ga terminal-overrides ",screen-256color*:Tc"
      set -g status-style 'bg=#333333 fg=#5eacd3'

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
    '';
  };
}
