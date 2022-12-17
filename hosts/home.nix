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
    firefox
    vscode
    crate2nix
  ];

  home.stateVersion = "22.11";
}
