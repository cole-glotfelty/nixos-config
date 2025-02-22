{ ... }:

{
  imports = [ ../common ../features/cli ../features/desktop ./home.nix ];

  features = {
    cli = {
      zsh.enable = true;
      # bash.enable = true;
      fzf.enable = true;
      # tmux.enable = true;
      # latex.enable = true;
      # vim.enable = true;
      # nixvim.enable = true;
      # git.enable = true;
      # ranger.enable = true;
    };

    desktop = {
      wayland.enable = true;
      # cursor.enable = true;
      # fuzzel.enable = true;
      # hyprland.enable = true;
      # zhongwen.enable = true;
      # xdg_dirs.enable = true;
    };
    # applications = {
    # mimeApps.enable = true;
    #   media.enable = true;
    #   messaging.enable = true;
    #   browsers.enable = true;
    #   kitty.enable = true;
    #   alacritty.enable = true;
    # };
  };
}
