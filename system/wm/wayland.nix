{ config, pkgs, ... }:

{
  # Don't forget to add back dbus.nix
  imports = [ ./pipewire.nix ./fonts.nix ./gnome-keyring.nix ];

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Configure xwayland
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
