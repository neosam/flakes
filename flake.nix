{
  description = "The system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  }; 

  outputs = { self, nixpkgs, home-manager }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = (
        import ./hosts {
          inherit nixpkgs lib;
          inherit system home-manager;
        } 
      );
      homeConfigurations = (
         import ./hosts {
            inherit nixpkgs lib system home-manager;
          }
      );
    };
}
