{
  description = "A basic flake with outils, jq, and orchestrator-cli";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    credential-manager-flake.url = "github:intersectMBO/credential-manager/cad3cee28d51335d8f7e4ad1ba79d3e9c05d5393";
    cardano-node.url = "github:IntersectMBO/cardano-node/8.12.0-pre";
  };

  outputs = { self, nixpkgs, flake-utils, credential-manager-flake, cardano-node, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.outils
            pkgs.openssl
            pkgs.jq
            credential-manager-flake.packages.${system}.orchestrator-cli
            cardano-node.outputs.packages.${system}.cardano-cli
          ];
        };
      }
    );
}
