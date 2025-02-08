{ inputs, pkgs, ... }:

let
  pkgs-hyprland =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [
    ./wayland.nix
    # ./ly.nix # why this no work
  ];

  # Security
  security = { pam.services.login.enableGnomeKeyring = true; };

  # Hints electron apps to use Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Display Manager
  services.displayManager.sddm.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    portalPackage = pkgs-hyprland.xdg-desktop-portal-hyprland;
  };
}
