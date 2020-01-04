let
  pkgs = import ../nixpkgs.nix;
in {
  hello = pkgs.hello;
}
