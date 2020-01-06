let
  # now tracking https://github.com/tbenst/nixpkgs/tree/nix-data
  nixpkgsSHA = "94a36f880665a0922fcb940531eda2e55715291a";
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