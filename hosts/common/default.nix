{ lib, inputs, outputs, pkgs, ... }:

{
  imports = [ ./users inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
    config.allowUnfree = true;
  };
  nix = {
    # nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; # for nixd LSP
    nixPath = [ "/etc/nix/path" ];

    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "root" "pharo" ];
    };

    optimise.automatic = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };

  # ZSH Default Shell
  users.defaultUserShell = pkgs.zsh;
}
