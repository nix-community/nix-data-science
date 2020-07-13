let
  pkgs = import ../nixpkgs.nix;
in {
  hello = pkgs.hello.overrideAttrs(old: {
    # change string to rebuild hello as a quick test
    # also recommend moving all other jobsets to "disabled-jobsets" folder
    madeup="hi20";
  });
}
