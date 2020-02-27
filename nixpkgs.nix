let
  # now tracking 20.03-release
  nixpkgsSHA = "be346a1f4bd9bf272c1388b7791cdb0f28bfa2fb";
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