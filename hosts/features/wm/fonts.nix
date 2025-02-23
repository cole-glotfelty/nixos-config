{ config, lib, pkgs, ... }:

with lib;
let cfg = config.features.wm.fonts;
in {
  options.features.wm.fonts.enable = mkEnableOption "enable fonts";

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      # TODO: Look into more font packages
      # TODO: Look into Apple Emoji font for system emoji font
      # TODO: Look into fontconfig option
      nerd-fonts.fira-code
      corefonts
      liberation_ttf
      source-han-sans
      source-han-serif
    ];
  };
}
