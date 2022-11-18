{
  description = ''
    Golines is a golang formatter that shortens long lines,
        in addition to all of the formatting fixes done by gofmt.'';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    golines = {
      url = "github:segmentio/golines/v0.11.0";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, golines }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages.default = pkgs.buildGoModule rec {
          pname = "golines";
          version = "0.11.0";
          src = golines;

          vendorSha256 = "sha256-rxYuzn4ezAxaeDhxd8qdOzt+CKYIh03A9zKNdzILq18=";
        };
      });
}
