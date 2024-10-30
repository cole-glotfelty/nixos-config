{ pkgs, ... }:

{
  # CLI Utils that are useful
  home.packages = with pkgs; [
    bat eza ripgrep fd fzf
    bottom
    wget curl
    htop
    disfetch

    pandoc
    zathura

    # Language Tools
    rustc
    go
  ];
}
