{ lib, system, home-manager, ... }:

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
          imports = [ ./home.nix ];
        };
      }
    ];
  };
}
