{ lib, pkgs, ... }:
{
  programs.niri.settings = {
    "spawn-at-startup" = [
      # {
      #   command = [
      #     "noctalia"
      #   ];
      # }
      {
        command = {
          "waybar"
        };
      }
      {
        command = [
          "nm-applet"
          "--indicator"
        ];
      }
    ];
    environment."NIXOS_OZONE_WL" = "1";
    input = {
      keyboard.xkb.layout = "fr";
    };
    binds = {
      "Mod+M".action."maximize-column" = { };
      "Mod+Q".action."close-window" = { };
      "Mod+Return".action.quit."skip-confirmation" = true;
      "XF86AudioRaiseVolume".action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1+"
      ];
      "XF86AudioLowerVolume".action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1-"
      ];
      "Mod+R".action.spawn = [
        "wofi"
      ];
      "Mod+T".action.spawn = [ "kitty" ];
      "Mod+1".action."focus-workspace" = 1;
      "Mod+2".action."focus-workspace" = 2;
    };
  };

}
