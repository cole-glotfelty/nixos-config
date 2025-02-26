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
      # TODO: This needs some love I want my old prompt back (no plugins though)
      zsh.enable = true;
      fzf.enable = true;
      tmux.enable = true;
      latex.enable = true;
      vim.enable = true;
      # TODO: This needs some love
      nixvim.enable = true;
      git.enable = true;
      ranger.enable = true;
      sshHosts.enable = true;
    };

    # TODO: do I need blueman and blueman applet?
    desktop = {
      # TODO: no wayland module here just WM/Compositors or maybe rename to waylandUtils
      wayland.enable = true;
      fuzzel.enable = true;
      hyprland.enable = true;
      waybar.enable = true;
      notifications.enable = true;
    };

    # TODO: options for applications and app set theming (fonts and colors, etc)
    # TODO: Maybe make a string option to select color schemes/theming?

    # style = {
    #   nix-colors. enable = true;
    # };

    xdg = {
      mimeApps.enable = true;
      xdg_dirs.enable = true;
    };

    applications = {
      media.enable = true;
      messaging.enable = true;
      browsers.enable = true;
      electronTweaks.enable = true;
      games.enable = true;
      kitty.enable = true;
      alacritty.enable = true;
    };
  };
}
