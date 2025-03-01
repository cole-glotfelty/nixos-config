{ config, lib, inputs, pkgs, ... }:

with lib;
let
  cfg = config.features.wm.hyprland;
  pkgs-hyprland =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  options.features.wm.hyprland.enable =
    mkEnableOption "enable hyprland system level settings";

  config = mkIf cfg.enable {

    # Security
    security = { pam.services.login.enableGnomeKeyring = true; };

    # Hints electron apps to use Wayland
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    # Display Manager
    # services.displayManager.sddm.enable = true;
    # TODO: Reference Sascha Koenig's Setup
    # services.displayManager.enable = mkForce false;

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
      portalPackage = pkgs-hyprland.xdg-desktop-portal-hyprland;
    };

  };
}
