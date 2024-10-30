{ config, pkgs, ... }:

{
  # boot.kernelPackages = pkgs.linux_zen;
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
