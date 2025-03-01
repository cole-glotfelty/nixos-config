{ pkgs, ... }:

{
  imports = [
    ./media.nix
    ./messaging.nix
    ./browsers.nix
    ./kitty.nix
    ./alacritty.nix
    ./games.nix
    ./electron.nix
    ./productivity.nix
  ];

  home.packages = with pkgs;
    [
      # Keyboard Configuration
      via
    ];
}
