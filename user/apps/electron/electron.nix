{ config, pkgs, ... }:

{
  # does this work? no
  xdg.desktopEntries = {
    discord = {
      inherit (pkgs.discord.desktop);
      exec = "discord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime";
    };
  };
}
