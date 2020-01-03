let
  nixpkgsSHA = "b0bbacb52134a7e731e549f4c0a7a2a39ca6b481";
  pkgs = import (fetchTarball
    "https://github.com/NixOS/nixpkgs-channels
/archive/${nixpkgsSHA}.tar.gz") {
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