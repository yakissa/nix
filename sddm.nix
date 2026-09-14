{ lib, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "fr";
  services.xserver.xkb.variant = "azerty";

  i18n.defaultLocale = "fr_FR.UTF-8";
  i18n.supportedLocales = [
    "fr_FR.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
  ];

  environment.sessionVariables = {
    LANG = "fr_FR.UTF-8";
    LC_ALL = "fr_FR.UTF-8";
  };

  services.displayManager = {
    defaultSession = "niri";
    sessionPackages = [ pkgs.niri ];
    sddm = {
      enable = true;
      theme = "catppuccin-mocha-mauve";
      wayland.enable = true;
      extraPackages = [ pkgs.catppuccin-sddm ];
    };
  };

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
    "/share/wayland-sessions"
  ];

  environment.systemPackages = with pkgs; [
    catppuccin-sddm
    niri
  ];
}
