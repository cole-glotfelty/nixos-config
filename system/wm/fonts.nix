{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    corefonts
    liberation_ttf
    source-han-sans
    source-han-serif
  ];
}
