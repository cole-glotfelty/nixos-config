{ config, pkgs, pkgs-unstable, userSettings, ... }:

{
  imports = [
    ../user/shell/sh.nix
    ../user/shell/cli-utils.nix
    ../user/pkgs/git/git.nix
    ../user/pkgs/ssh/ssh.nix
    ../user/pkgs/vim/vim.nix
    # ../user/pkgs/neovim/neovim.nix 
    ../user/pkgs/nixvim/nixvim.nix
    ../user/pkgs/bluetooth/blueman.nix
    ../user/apps/terminals/kitty.nix
    ../user/apps/terminals/alacritty.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # core
    fira-code-nerdfont
    foliate
    mpv
    via

    ungoogled-chromium

    # Messaging
    discord
    slack
    signal-desktop

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERM = userSettings.term;
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/Media/Music";
      videos = "${config.home.homeDirectory}/Media/Videos";
      pictures = "${config.home.homeDirectory}/Media/Pictures";
      templates = "${config.home.homeDirectory}/Templates";
      download = "${config.home.homeDirectory}/Downloads";
      documents = "${config.home.homeDirectory}/Documents";
      desktop = null;
      publicShare = null;
      extraConfig = {
        XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
        XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
        XDG_GAME_DIR = "${config.home.homeDirectory}/Media/Games";
        XDG_GAME_SAVE_DIR = "${config.home.homeDirectory}/Media/Game Saves";
      };
    };
  };

  news.display = "silent";

}
