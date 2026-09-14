{ pkgs, ... }:
let
  pythonEnv = pkgs.python3.withPackages (
    ps: with ps; [
      pygobject3
      dbus-python
    ]
  );
in
{
  home.packages = [
    pythonEnv
    pkgs.playerctl
    pkgs.gobject-introspection
  ];

  home.sessionVariables = {
    GI_TYPELIB_PATH = "${pkgs.playerctl}/lib/girepository-1.0:${pkgs.gobject-introspection}/lib/girepository-1.0";
  };

  home.file.".media-player.py" = {
    source = ./mediaplayer.py;
    executable = true;
  };
}
