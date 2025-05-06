{
  description = "Home Manager flake for specific declarative configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      ...
    }:
    let
      mkHomeConfig =
        {
          system,
          username,
          homeDirectory ? "/home/${username}",
          ...
        }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home.nix
            stylix.homeManagerModules.stylix
            {
              home = {
                inherit username homeDirectory;
                stateVersion = "24.11";
              };
            }
          ];
        };
    in
    {
      homeConfigurations = {
        "saik" = mkHomeConfig {
          system = "x86_64-linux";
          username = "saik";
        };
      };
    };
}
