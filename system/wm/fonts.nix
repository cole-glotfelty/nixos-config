{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    corefonts
    source-han-sans
    source-han-serif
  ];
}
