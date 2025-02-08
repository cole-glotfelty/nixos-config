{ pkgs, ... }:

{
  # CLI Utils that are useful
  home.packages = with pkgs; [
    bat eza ripgrep fd fzf
    htop bottom
    wget curl
    fastfetch # has home manager options
    sshfs
    magic-wormhole
    libqalculate # qalc
    tealdeer

    # Applications
    pandoc
    imagemagick
    hugo

    # Language Tools
    # gcc # clang # have to choose one
    # rustc
    # cargo
    # go
    # python3
    # erlang
  ];
}
