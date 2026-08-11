{ pkgs, ... }: 
{
  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 400;
      mode = "drun";
      allow_images = true;
    };
    style = ''
      #window {
        background-color: rgba(40, 42, 54, 0.9);
        border-radius: 8px;
        color: #f8f8f2;
      }
      #entry:selected {
        background-color: #6272a4;
      }
    '';
  };
}