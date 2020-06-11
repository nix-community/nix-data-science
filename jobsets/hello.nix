let
  pkgs = import ../nixpkgs.nix;
in {
  hello = pkgs.hello.overrideAttrs(old: {
    madeup="hi8";
  });
}
