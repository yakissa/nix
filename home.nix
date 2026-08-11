{ pkgs, inputs, ... }:
{
  home.username = "june";
  home.homeDirectory = "/home/june";
  imports = with inputs; [
        ./niri.nix
        # niri.homeModules.niri
  ];
  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
