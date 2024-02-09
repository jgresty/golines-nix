{
  description = ''
    Golines is a golang formatter that shortens long lines,
        in addition to all of the formatting fixes done by gofmt.'';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    golines = {
      url = "github:segmentio/golines/v0.12.2";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, golines }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages.default = pkgs.buildGoModule rec {
          pname = "golines";
          version = "0.12.2";
          src = golines;

          vendorHash = "sha256-jI3/m1UdZMKrS3H9jPhcVAUCjc1G/ejzHi9SCTy24ak=";
        };
      });
}
