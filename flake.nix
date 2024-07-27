{
  description = "The McMojave cursor theme ported to hyprcusor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";

    hyprlang = {
      url = "github:hyprwm/hyprlang";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      utils,
      hyprlang,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in

      {
        packages = {
          mcmojave-hyprcursor-light = pkgs.callPackage ./nix/light.nix { inherit pkgs; };
          mcmojave-hyprcursor-dark = pkgs.callPackage ./nix/dark.nix { inherit pkgs; };
        };

        formatter = nixpkgs.${system}.nixpkgs-fmt;
      }
    );
}
