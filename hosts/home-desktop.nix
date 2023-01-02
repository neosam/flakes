{ config, pkgs, ...}:

{
  home.packages = with pkgs; [ 
    firefox
    vscode
    signal-desktop
    superTux
    superTuxKart
    google-chrome
  ];
}
