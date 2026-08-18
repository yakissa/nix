{
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can change the word unstable to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:4evy/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      niri,
      stylix,
      noctalia,
      ...
    }:
    let
      system = "x86_64-linux";
      specialArgs = {
        inherit system inputs;
      };
    in
    {
      nixosConfigurations.june = nixpkgs.lib.nixosSystem {
        specialArgs = specialArgs;
        modules = [
          ./sddm.nix
          ./hosts/configuration.nix
          home-manager.nixosModules.home-manager
	  stylix.nixosModules.stylix
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }

        ];
      };
      # ma config sur le desktop (à définir)
      # nixosConfigurations.juneDS = nixpkgs.lib.nixosSystem {
      #   specialArgs = specialArgs;
      #   modules = [
      #          ./hosts/configuration.nix
      #          home-manager.nixosModules.home-manager
      #          {
      #          	home-manager.useGlobalPkgs = true;
      #          	home-manager.useUserPackages = true;
      #          }
      #
      #   ];
      # };
    };
}
