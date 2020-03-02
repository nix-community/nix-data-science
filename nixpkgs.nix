let
  # now tracking 20.03-release
  nixpkgsSHA = "181974248e256249771d9d8bcd8935c9a77f725b";
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