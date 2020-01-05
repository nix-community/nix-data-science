let
  pkgs = import ../nixpkgs.nix;
in {
  # is this needed for shell to be cached properly?
  # python-env = pkgs.python3.withPackages (ps: with ps; [
  #   ...
  # ]);

  apache-airflow = pkgs.python3Packages.apache-airflow;
  av = pkgs.python3Packages.av;
  click = pkgs.python3Packages.click;
  dill = pkgs.python3Packages.dill;
  h5py = pkgs.python3Packages.h5py;
  ipython = pkgs.python3Packages.ipython;
  ipywidgets = pkgs.python3Packages.ipywidgets;
  joblib = pkgs.python3Packages.joblib;
  jupyterlab = pkgs.python3Packages.jupyterlab;
  matplotlib = pkgs.python3Packages.matplotlib;
  moviepy = pkgs.python3Packages.moviepy;
  mypy = pkgs.python3Packages.mypy;
  nbdime = pkgs.python3Packages.nbdime;
  numpy = pkgs.python3Packages.numpy;
  opencv3 = pkgs.python3Packages.opencv3;
  pandas = pkgs.python3Packages.pandas;
  pims = pkgs.python3Packages.pims;
  pytorch = pkgs.python3Packages.pytorch;
  torchvision = pkgs.python3Packages.torchvision;
  pyyaml = pkgs.python3Packages.pyyaml;
  requests = pkgs.python3Packages.requests;
  rpy2 = pkgs.python3Packages.rpy2;
  scikitimage = pkgs.python3Packages.scikitimage;
  scikitlearn = pkgs.python3Packages.scikitlearn;
  scipy = pkgs.python3Packages.scipy;
  seaborn = pkgs.python3Packages.seaborn;
  tensorflow = pkgs.python3Packages.tensorflow;
  tensorflow-probability = pkgs.python3Packages.tensorflow-probability;
  tifffile = pkgs.python3Packages.tifffile;
  tqdm = pkgs.python3Packages.tqdm;
}
