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
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        height = 16;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [
          #"custom/launcher"
          "wlr/taskbar"
          "sway/workspaces"
        ];
        modules-center = [
          #"group/windowmod"
          "clock"
          "custom/media"
        ];
        modules-right = [
          "tray"
          # "group/mediamod"
          # "group/audiomod"
          # "group/clockmod"
          # "custom/swaync"

          "temperature"
          "battery"
          "custom/wlogout"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        "custom/launcher" = {
          format = "<span font='18'>󰣇</span>";
          on-click = "rofi -show drun";
          on-click-right = "rofi -show run";
        };

        "custom/wlogout" = {
          on-click = "wlogout";
          format = "";
        };

        # "network" = {
        # format= "{ifname}";
        # format-wifi= "<span font='14'>{icon}</span>";
        # format-ethernet="<span font='14'>󰈀<</span>";
        # format-disconnected= "<span font='14'>󰣼</span>";
        # tooltip-format="{ipaddr}  {bandwidthUpBits}  {bandwidthDownBits}";
        # format-linked="<span font='14'>󰈀<</span>";
        # tooltip-format-wifi= "{essid} {icon} {signalStrength}%";
        # tooltip-format-ethernet="{ifname} 󰈀";
        # tooltip-format-disconnected"= "󰣼 Disconnected";
        # max-length= 30;
        # format-icons= ["󰣾", "󰣴", "󰣶", "󰣸", "󰣺"];
        # };

        # "network#speed" = {
        # interval = 1;
        # format= "{ifname}";
        # format-wifi=" {bandwidthUpBytes}  {bandwidthDownBytes}";
        # format-ethernet= " {bandwidthUpBytes}  {bandwidthDownBytes}";
        # format-disconnected= " 0.00B/s  0.00B/s";
        # tooltip-format= "{ipaddr}";
        # format-linked= "󰈁 {ifname} (No IP)";
        # tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
        # tooltip-format-ethernet="{ifname} 󰌘";
        # tooltip-format-disconnected = "󰌙 Disconnected";
        # min-length = 20;
        # max-length = 24;
        # #on-click = "hyprctl dispatch exec '[float; size 512 512; center] kitty nmtui'";
        # };

        tray = {

          icon-size = 18;

          spacing = 8;
        };

        # "custom/hyprpicker" =
        # {
        #   format = "󰈋";
        #   on-click= "hyprpicker -a -f hex";
        #   on-click-right= "hyprpicker -a -f rgb";
        # };

        # "clock#icon":
        # {
        #   "format": "<span font='14'>󰸗</span>",
        #   "tooltip-format": "<tt><small>{calendar}</small></tt>",
        #   "calendar":
        #   {
        #     "mode"          : "year",
        #     "mode-mon-col"  : 3,
        #     "weeks-pos"     : "right",
        #     "on-scroll"     : 1,
        #     "format":
        #     {
        #       "months":     "<span color='#ffead3'><b>{}</b></span>",
        #       "days":       "<span color='#ecc6d9'><b>{}</b></span>",
        #       "weeks":      "<span color='#99ffdd'><b>W{}</b></span>",
        #       "weekdays":   "<span color='#ffcc66'><b>{}</b></span>",
        #       "today"      "<span color='#ff6699'><b><u>{}</u></b></span>"
        #     }
        #   };
        #   "actions"=
        #   {
        #     "on-click-right= "mode";
        #     on-scroll-up="tz_up";
        #     on-scroll-down= "tz_down";
        #     on-scroll-up= "shift_up";
        #     on-scroll-down= "shift_down";
        #   };
        # };
        # "clock#date" =
        # {
        #   format = "{:%a %b %d %R}";
        #   tooltip-format = "<tt><small>{calendar}</small></tt>";
        #   calendar =
        #   {
        #     mode =  "year";
        #     mode-mon-col =   3;
        #     weeks-pos ="right";
        #     on-scroll     = 1;
        #     "format" =
        #     {
        #       months =    "<span color='#ffead3'><b>{}</b></span>";
        #       days =       "<span color='#ecc6d9'><b>{}</b></span>";
        #       weeks =   "<span color='#99ffdd'><b>W{}</b></span>";
        #       weekdays =   "<span color='#ffcc66'><b>{}</b></span>";
        #       today =      "<span color='#ff6699'><b><u>{}</u></b></span>";
        #     }
        #   };
        #   "actions" =
        #   {
        #     on-click-right= "mode";
        #     on-scroll-up= "tz_up";
        #     on-scroll-down= "tz_down";
        #     on-scroll-up= "shift_up";
        #     on-scroll-down= "shift_down";
        #   }
        # };
        # "group/clockmod" =
        # {
        #   orientation = "horizontal";
        #   modules =
        #   [
        #     "clock#icon"
        #     "clock#date"
        #   ]
        # };

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
    style = builtins.readFile ./waybar.css;
  };
}

#  {

# "battery":
# {
#   "states":
#   {
#     "good": 95,
#     "warning": 30,
#     "critical": 15
#   },

#   "format":"{icon}  {capacity}%",
#   "format-charging": "{capacity}% ",
#   "format-plugged": "{capacity}% ",
#   "format-alt": "{icon} {time}",
#   // "format-good": "", // An empty format will hide the module
#   // "format-full": "",
#   "format-icons": ["", "", "", "", ""]
# },

# "memory":
# {
#   "format": "󰍛 {}%",
#   "format-alt": "󰍛 {used}/{total} GiB",
#   "interval": 5
# },

# "cpu":
# {
#   "format": "󰻠 {usage}%",
#   "format-alt": "󰻠 {avg_frequency} GHz",
#   "interval": 5
# },

# "disk":
# {
#   "format": "󰋊 {}%",
#   "format-alt": "󰋊 {used}/{total} GiB",
#   "interval": 5,
#   "path": "/mnt/Datos"
# },

#  }
