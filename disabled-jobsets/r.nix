let
  pkgs = import ../nixpkgs.nix;
  rPacks = with pkgs.rPackages; [
    ggplot2
    dplyr
    xts
    freqparcoord
    RANN
    MASS
    Rcpp
    tidyverse
  ];
in
{
  RStudio = pkgs.rstudioWrapper.override{ packages = rPacks; };
  R = pkgs.rWrapper.override{ packages = rPacks; };
}
