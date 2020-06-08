let
  # 20.03-release as of 2020-05-07
  nixpkgsSHA = "e2bb73ce5f786b83e984b80199112f86b8a6cc9d";
  pkgs = import (fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/${nixpkgsSHA}.tar.gz") {
      system = builtins.currentSystem;
      overlays = import ./overlays.nix;
      config = with pkgs.stdenv; {
        whitelistedLicenses = with lib.licenses; [
          unfreeRedistributable
          issl
         ];
        allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
          "cudnn_cudatoolkit"
          "cudatoolkit"
        ];
      };
    };

in pkgs