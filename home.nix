{ pkgs, inputs, ... }:
{
  home.username = "june";
  home.homeDirectory = "/home/june";
  imports = with inputs; [
    ./niri.nix
    ./wofi.nix
    ./vencord.nix
    ./waybar.nix
    # niri.homeModules.niri
  ];
  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
