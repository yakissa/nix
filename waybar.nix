{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [
          "wlr/taskbar"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "temperature"
          "battery"
          "custom/wlogout"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        "custom/wlogout" = {
          on-click = "wlogout";
          format = "";
        };

      };
    };
  };
}
