{ pkgs, ... }:

{
  # CLI Utils that are useful
  home.packages = with pkgs; [
    bat eza ripgrep
    pandoc
    wget curl
    htop
    disfetch
    zathura

    # Language Tools
    rustc
    go
  ];
}
