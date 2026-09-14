{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    hack-font
    mplus-outline-fonts.githubRelease
    dina-font
    font-awesome
    nerd-fonts.symbols-only
    nerd-fonts.fira-code
  ];
}
