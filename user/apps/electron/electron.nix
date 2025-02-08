{ config, pkgs, ... }:

{
  xdg.desktopEntries = {
    # fcitx5 with electron applications
    discord = {
      inherit (pkgs.discord.desktop);
      exec = "discord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime";
    };
  };
}
