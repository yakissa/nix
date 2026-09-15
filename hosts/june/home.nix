{ pkgs, inputs, ... }:
{
  home.username = "june";
  home.homeDirectory = "/home/june";
  imports = with inputs; [
    niri.homeModules.niri
    ./niri.nix
    ./fonts.nix
    ../../services/mako.nix
    ../../flakes/wofi.nix
    ../../flakes/vencord.nix
    ../../flakes/waybar/waybar.nix
    ../../flakes/waybar/mediaplayer.nix
    ../../flakes/pipewire.nix
    ../../flakes/catppuccin.nix
    ../../flakes/wlogout/wlogout.nix
  ];
  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
