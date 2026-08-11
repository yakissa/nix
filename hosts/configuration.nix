# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  imports = with inputs; [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  hardware.graphics.enable = true;

  nix.settings.extra-experimental-features = [ "nix-command" "flakes" ];

  fonts.enableDefaultPackages = true;
  

  networking.hostName = "june"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";
 

  # Define a user account. Don't forget to set a password with ‘passwd’.
  home-manager.users.june = ../home.nix;
  users.users.june = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
      neovim
    ];
  };

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  nixpkgs.config.allowUnfree = true;
  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    neovim
    kitty
    vscode
    firefox
    kdePackages.dolphin
  ];

  xdg.portal = {
  enable = true;
  extraPortals = with pkgs; [
    kdePackages.xdg-desktop-portal-kde
    xdg-desktop-portal-gtk
  ];
  config = {
    common.default = [ "gtk" ];
    niri = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
    };
  };
};

  system.stateVersion = "26.05"; # Did you read the comment?

}

