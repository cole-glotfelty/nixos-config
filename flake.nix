{
  description = "System Configuration of Cole Glotfelty";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: 

  let 
    system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem { #value is typically host name
	# inherit system;
        modules = [ ./pharo/configuration.nix ];
	specialArgs = {
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
	  inherit pkgs-unstable;
	};
      };
    };
  };
}
