{ pkgs, ... }:
let
  mediaPython = pkgs.python3.withPackages (
    ps: with ps; [
      pygobject3
      dbus-python
    ]
  );
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 15;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [
          "wlr/taskbar"
        ];
        modules-center = [
          "clock"
          "custom/media"
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
        "custom/media" = {
          format = "{icon} {text}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "env GI_TYPELIB_PATH='${pkgs.playerctl}/lib/girepository-1.0:${pkgs.gobject-introspection}/lib/girepository-1.0' ${mediaPython}/bin/python /home/june/.media-player.py --player spotify 2> /dev/null";
        };

      };
    };
    style = builtins.readFile ./waybar/waybar.css;
  };
}
