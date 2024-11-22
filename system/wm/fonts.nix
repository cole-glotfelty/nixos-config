{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerdfonts
    corefonts
    source-han-sans
    source-han-serif
  ];
}
