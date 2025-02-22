{ pkgs, ... }:

{
  imports = [ ./zsh.nix ./fzf.nix ];

  # NOTE: You may have to change some of these in the future
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraOptions = [ "--icons" "--git" ];
  };

  programs.bat.enable = true;

  home.packages = with pkgs; [
    coreutils-full
    ripgrep
    fd
    bat
    fzf
    htop
    bottom
    zip
    unzip
    wget
    curl
    sshfs
    tealdeer
    magic-wormhole
    libqalculate
    fastfetch

    # Applications
    pandoc
    imagemagick
    hugo
  ];
}
