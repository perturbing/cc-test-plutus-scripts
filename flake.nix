{
  description = "A basic flake with outils, jq, and orchestrator-cli";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    credential-manager-flake.url = "github:intersectMBO/credential-manager/befb10dfe8aaade091ca8c9d0cfa69e5f324cf46";
    cardano-node.url = "github:IntersectMBO/cardano-node/8.11.0-pre";
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
