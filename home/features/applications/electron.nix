{ config, lib, pkgs, ... }:

with lib;
let cfg = config.features.applications.electronTweaks;
in {
  options.features.applications.electronTweaks.enable =
    mkEnableOption "tweaks for electron applications";
  config = mkIf cfg.enable {
    xdg.desktopEntries.discord = {
      name = "Discord";
      exec =
        "discord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime";
      icon = "discord";
      type = "Application";
      terminal = false;
    };

  };
}
