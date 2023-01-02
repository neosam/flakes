{ nixpkgs, lib, system, home-manager, ... }:

{
  framework = lib.nixosSystem {
    inherit system;
    modules = [ 
      ./framework
      ./configuration.nix
      
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.neosam = {
          imports = [ ./home.nix ./home-desktop.nix ];
        };
      }
    ];
  };
  macbook = 
    let
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        config.allowUnfree = true;
      };
    in 
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs; modules = [
          ./home-mac.nix
        ];
      };
}
