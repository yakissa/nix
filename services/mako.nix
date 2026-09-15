{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
  ];
  services.mako = {
    enable = true;
    anchor = "bottom-right";
    backgroundColor = "#000000FF"; # mettre une var globale ??
    borderColor = "#FFFFFFFF"; # x2
    borderRadius = 8;
    defaultTimeout = 6000;
    font = "FiraCode Nerd Font Mono 12";
  };
}
