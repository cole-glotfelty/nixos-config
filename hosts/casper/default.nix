{ ... }:

{
  imports = [ ../common ./configuration.nix ];

  # features = {
  #   hardware = {
  #     bluetooth.enable = true;
  #     zenKernel.enable = true;
  #     zramSwap.enable = true;
  #     QMKkeyboard.enable = true;
  #     opengl.enable = true;
  #     printing.enable = true;
  #   };
  #
  #   security = {
  #     blocklist.enable = true;
  #     doas.enable = true;
  #   };
  #
  #   apps = {
  #     mullvad-vpn.enable = true;
  #     steam.enable = true;
  #   };
  #
  #   wm = {
  #     hyprland.enable = true;
  #     sound.enable = true;
  #     wayland.enable = true;
  #     fonts.enable = true;
  #     dbus.enable = true;
  #     keyring.enable = true;
  #   };
  # };
}
