{
  description = "System Configuration of Cole Glotfelty";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: 
  outputs = inputs@{ self, ... }: 

  let 
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${system};

  in {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem { #value is typically host name
        modules = [ ./pharo/configuration.nix ];
	specialArgs = {
	  inherit inputs;
	  inherit pkgs;
	  inherit pkgs-unstable;
	};
      };
    };
    homeConfigurations = {
      pharo = inputs.home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
        modules = [ ./pharo/home.nix ];
	extraSpecialArgs = {
	  inherit inputs;
	  inherit pkgs-unstable;
	};
      };
    };
  };
}
