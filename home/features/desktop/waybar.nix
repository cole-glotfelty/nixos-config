{ config, lib, pkgs, ... }:

with lib;
let cfg = config.features.desktop.waybar;
in {
  options.features.desktop.waybar.enable = mkEnableOption "enable waybar";

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      package = (pkgs.waybar.overrideAttrs (oldAtts: {
        mesonFlags = oldAtts.mesonFlags ++ [ "-Dexperimental=true" ];
      }));
    };
  };
}
