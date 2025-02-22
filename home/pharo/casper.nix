{ ... }:

{
  imports = [
    ../common
    ../features/cli
    ../features/desktop
    ../features/applications
    ../features/xdg
    ./home.nix
  ];

  features = {
    cli = {
      zsh.enable = true;
      fzf.enable = true;
      tmux.enable = true;
      # TODO: This needs love

      # latex.enable = true;
      vim.enable = true;
      # TODO: This needs some love

      # nixvim.enable = true;
      git.enable = true;
      ranger.enable = true;
    };

    desktop = {
      # TODO: no wayland module here just WM/Compositors or maybe rename to waylandUtils
      wayland.enable = true;
      # cursor.enable = true;
      # NOTE: this may be should be a system level thing

      # fonts.enable = true;
      # fuzzel.enable = true;
      # hyprland.enable = true;
      # waybar.enable = true;
      # zhongwen.enable = true;
    };

    xdg = {
      mimeApps.enable = true;
      xdg_dirs.enable = true;
    };

    applications = {
      media.enable = true;
      messaging.enable = true;
      browsers.enable = true;
      games.enable = true;
      kitty.enable = true;
      alacritty.enable = true;
    };
  };
}
