{
  description = "System Configuration 2024-09-28";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 

  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem { #value is typically host name
	inherit system;
        modules = [ ./system/configuration.nix ];
      };
    };
    homeConfigurations = {
      pharo = home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
        modules = [ ./home/home.nix ];
      };
    };
  };
}
