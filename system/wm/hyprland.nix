{ inputs, pkgs, ... }:

let
  pkgs-hyprland =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [ ./wayland.nix ];

  # Security
  security = { pam.services.login.enableGnomeKeyring = true; };

  # Hints electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Display Manager
  services.displayManager.sddm.enable = true;

  programs.hyprland = {
    enable = true;
    # Below line is fubar
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    portalPackage = pkgs-hyprland.xdg-desktop-portal-hyprland;
  };
}
