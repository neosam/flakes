{ config, pkgs, ...}:

{
  home.username = "neosam";
  home.homeDirectory = "/home/neosam";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [ 
    htop 
    gitui 
    helix 
    git-town 
    crate2nix
    du-dust
    cryptomator
    nextcloud-client
    gnomeExtensions.appindicator
  ];

  home.stateVersion = "22.11";
}
