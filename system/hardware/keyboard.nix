{ pkgs, ... }:

{
  # environment.systemPackages = with pkgs; [ usbutils ];
  hardware.keyboard.qmk.enable = true;
}
