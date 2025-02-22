{ pkgs, ... }:

{
  imports = [ ./zsh.nix ./fzf.nix ./tmux.nix ./vim.nix ./ranger.nix ./git.nix ];

  # NOTE: You may have to change some of these in the future
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraOptions = [ "--icons" "--git" ];
  };

  programs.bat.enable = true;

  home.packages = with pkgs; [
    # Core
    coreutils-full
    ripgrep
    fd
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
