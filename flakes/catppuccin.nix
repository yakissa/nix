{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];
  catppuccin = {
    enable = true;
    flavor = "latte";
    accent = "teal";
    autoEnable = true;
  };
}
