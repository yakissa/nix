# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = with inputs; [
    # Include the results of the hardware scan.
    inputs.nlock.nixosModules.default
    ./hardware-configuration.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  # nixpkgs.config.cudaSupport = true;
  hardware.graphics.enable = true;

  nix.settings.extra-experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings = {
    substituters = [ "https://cachix.org" ];
    trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];

    # Force Nix à utiliser le cache en priorité absolue
    builders-use-substitutes = true;
  };
  virtualisation.docker.enable = true;
  fonts.enableDefaultPackages = true;
  #services.upower.enable = true;
  networking.hostName = "june"; # Define your hostname.
  networking.networkmanager.enable = true;
  programs.xwayland.enable = true;
  services.blueman.enable = true;
  hardware.enableAllFirmware = true;
  programs.nm-applet.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.steam.enable = true;
  programs.steam.package = pkgs.steam.override {
    extraArgs = "-system-composer";
  };
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="input", ATTRS{id/vendor}=="0079", ATTRS{id/product}=="0006", ENV{ID_INPUT_JOYSTICK}=""
  '';
  services.udisks2.enable = true;
  # Set your time zone.
  time.timeZone = "Europe/Paris";
  services.input-remapper = {
    enable = true;
    enableUdevRules = true;
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.niri.enable = true;
  home-manager.users.june = ./june/home.nix;
  users.users.june = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "input"
      "uinput"
    ];
    packages = with pkgs; [
      tree
      neovim
    ];
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  nixpkgs.config.allowUnfree = true;
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    neovim
    kitty
    vscode
    firefox
    nixfmt
    awww
    kdePackages.dolphin
    signal-desktop
    pavucontrol
    grim
    slurp
    swappy
    spotify
    tor-browser
    kdePackages.kleopatra
    gparted-full
    unzip
    retroarch-full
    p7zip
    cachix
    ryubing
    xwayland-satellite
    rar
    xinput
    evtest
    libreoffice-fresh
  ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ glibc ];
  services.playerctld.enable = true;
  environment.variables = {
    PATH = lib.concatStringsSep ":" [
      "/run/current-system/sw/bin"
      "/run/current-system/profile/bin"
      "/opt/android-sdk/cmdline-tools/latest/bin"
      "/opt/android-sdk/platform-tools"
    ];
    DISPLAY = ":0";
  };
  system.stateVersion = "26.05"; # Did you read the comment?

}
