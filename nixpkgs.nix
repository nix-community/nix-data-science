let
  # now tracking https://github.com/tbenst/nixpkgs/tree/nix-data
  nixpkgsSHA = "40e11a4fd00b82805e7f647dcbd32aeaa1eeffb5";
  pkgs = import (fetchTarball
    "https://github.com/tbenst/nixpkgs/archive/${nixpkgsSHA}.tar.gz") {
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