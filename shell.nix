with import ./nixpkgs;

stdenv.mkDerivation {
    name = "data-science-shell";
    # is there some way to be DRY with release.nix?
    # also, it may make sense in future to specific shells for say python
    # rather than pulling in all dependencies
    buildInputs = [ hello ];
}
