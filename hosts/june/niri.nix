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
        command = [
          "waybar"
        ];
      }
      {
        command = [
          "nm-applet"
          "--indicator"
        ];
      }
    ];

    environment = {
      "NIXOS_OZONE_WL" = "1";
      "DISPLAY" = ":0";
    };

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
      "Mod+Print".action.spawn = [
        "sh"
        "-c"
        "${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.swappy}/bin/swappy -f -"
      ];
      "Mod+T".action.spawn = [ "kitty" ];
      "Mod+1".action."focus-workspace" = 1;
      "Mod+2".action."focus-workspace" = 2;
    };

    cursor = {
      theme = "Bibata Modern Classic";
    };

    layout = {
      gaps = 8;
      center-focused-column = "never";
      always-center-single-column = true;
      empty-workspace-above-first = true;
      default-column-display = "tabbed";
      background-color = "transparent";

      default-column-width = {
        proportion = 0.3;
      };

      focus-ring = {
        enable = false;
        width = 4;
        # active-gradient from="#80c8ff" to="#bbddff" angle=45
        # inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
        # urgent-gradient from="#800" to="#a33" angle=45
      };

      border = {
        enable = false;
        width = 4;
        # active-gradient from="#ffbb66" to="#ffc880" angle=45 relative-to="workspace-view"
        # inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view" in="srgb-linear"
        # urgent-gradient from="#800" to="#a33" angle=45
      };

      shadow = {
        enable = false;
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
        draw-behind-window = true;
        color = "#93bbff";
        inactive-color = "#000000";
      };

      tab-indicator = {
        enable = true;
        hide-when-single-tab = true;
        place-within-column = true;
        gap = 5;
        width = 4;
        length = {
          total-proportion = 1.0;
        };
        position = "right";
        gaps-between-tabs = 2;
        corner-radius = 8;
        #active-color = "red";
        #inactive-color = "gray";
        #urgent-color = "blue";
        # active-gradient from="#80c8ff" to="#bbddff" angle=45
        # inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
        # urgent-gradient from="#800" to="#a33" angle=45
      };

      insert-hint = {
        enable = true;
        #color = "#ffc87f80";
        # gradient from="#ffbb6680" to="#ffc88080" angle=45 relative-to="workspace-view"
      };

      struts = {
        #left = 64;
        #right = 64;
        top = 32;
        bottom = 32;
      };
    };

  };
}
