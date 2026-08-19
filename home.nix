{ pkgs, inputs, ... }:
{
  home.username = "june";
  home.homeDirectory = "/home/june";
  imports = with inputs; [
    niri.homeModules.niri
    ./niri.nix
    ./wofi.nix
    ./vencord.nix
    ./waybar.nix
    ./fonts.nix
    #    ./noctalia.nix
    ./pipewire.nix
  ];
  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
