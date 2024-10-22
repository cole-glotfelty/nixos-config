{ pkgs, ... }:

{
  # CLI Utils that are useful
  home.packages = with pkgs; [
    bat eza ripgrep
    pandoc
    # vim 
    neovim
    wget curl
    htop
    disfetch
    zathura

    # Language Tools
    rustc
    go
  ];
}
