let
  # 20.09-release as of 2021-04-11
  nixpkgsSHA = "b39544be6c2e554fc494140d1d8d1b412b2762a5";
  pkgs = import
    (fetchTarball
      "https://github.com/NixOS/nixpkgs/archive/${nixpkgsSHA}.tar.gz")
    {
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

in
pkgs
