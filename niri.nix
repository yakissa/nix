{ lib, pkgs,  ...}:
{ 
 programs.niri = {
         enable = true;
	 settings = {
		 environment."NIXOS_OZONE_WL" = "1";
		 input = {
			 keyboard.xkb.layout = "fr";
		 };
		 binds = {
			 #"Mod+M".action.maximize-window-to-edges = true;
			 "Mod+Q".action.quit.skip-confirmation =true;
			 "Mod+T".action.spawn = [ "kitty" ];
			 "Mod+1".action.focus-workspace = 1;
			 "Mod+2".action.focus-workspace = 2;
		 };	 
	 };
 };

}
