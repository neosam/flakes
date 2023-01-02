{ config, pkgs, ...}:

let defaultHome = import ./home.nix { inherit config pkgs; };
    homeOverride = {
      username = "simongoller";
      homeDirectory = "/Users/simongoller";
    };
in defaultHome // {
  home = defaultHome.home // homeOverride;    
}
