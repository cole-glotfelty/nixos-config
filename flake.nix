{
  description = "System Configuration of Cole Glotfelty";

  outputs = inputs@{ self, ... }:

    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos";
        timezone = "America/New_York";
        locale = "en_US.UTF-8";
      };

      userSettings = {
        username = "pharo";
        name = "Cole Glotfelty";
        editor = "nvim";
        term = "kitty";
        browser = "firefox";
      };

      pkgs = import inputs.nixpkgs {
        system = systemSettings.system;
        config = { allowUnfree = true; };
      };

      pkgs-unstable = import inputs.nixpkgs-unstable {
        system = systemSettings.system;
        config = { allowUnfree = true; };
      };

      lib = inputs.nixpkgs.lib;
      home-manager = inputs.home-manager;

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem { # value is typically host name
          system = systemSettings.system;
          modules = [ ./pharo/configuration.nix ];
          specialArgs = {
            inherit inputs;
            inherit systemSettings;
            inherit userSettings;
            inherit pkgs;
            inherit pkgs-unstable;
          };
        };
      };

      homeConfigurations = {
        pharo = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./pharo/home.nix ];
          extraSpecialArgs = {
            inherit inputs;
            inherit systemSettings;
            inherit userSettings;
            inherit pkgs-unstable;
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };
  };
}
