{
  description = "System Configuration of Cole Glotfelty";

  outputs = inputs@{ self, ... }:
    let
      systemSettings = {
        system = "x86_64-linux";
        host = "Optiplex 7040";
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
        config.allowUnfree = true;
      };
      pkgs-stable = import inputs.nixpkgs-stable {
        system = systemSettings.system;
        config.allowUnfree = true;
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
            inherit pkgs-stable;
          };
        };
      };

      homeConfigurations = {
        pharo = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./pharo/home.nix ];
          extraSpecialArgs = {
            inherit inputs;
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };
  };
}
