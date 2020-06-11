let pkgs = import ../nixpkgs.nix;
in {
  # is this needed for shell to be cached properly?
  # python-env = pkgs.python3.withPackages (ps: with ps; [
  #   ...
  # ]);

  apache-airflow = pkgs.python3Packages.apache-airflow;
  av = pkgs.python3Packages.av;
  bokeh = pkgs.python3Packages.bokeh;
  cython = pkgs.python3Packages.cython;
  click = pkgs.python3Packages.click;
  dill = pkgs.python3Packages.dill;
  future = pkgs.python3Packages.future;
  h5py = pkgs.python3Packages.h5py;
  ipython = pkgs.python3Packages.ipython;
  imgaug = pkgs.python3Packages.imgaug;
  ipywidgets = pkgs.python3Packages.ipywidgets;
  joblib = pkgs.python3Packages.joblib;
  jupyterlab = pkgs.python3Packages.jupyterlab;
  matplotlib = pkgs.python3Packages.matplotlib;
  moviepy = pkgs.python3Packages.moviepy;
  # mlflow = pkgs.python3Packages.mlflow;
  # mlflow-server = pkgs.mlflow-server;
  mypy = pkgs.python3Packages.mypy;
  nbdime = pkgs.python3Packages.nbdime;
  nose = pkgs.python3Packages.nose;
  numpy = pkgs.python3Packages.numpy;
  opencv3 = pkgs.python3Packages.opencv3;
  opencv4 = pkgs.python3Packages.opencv4;
  pandas = pkgs.python3Packages.pandas;
  pims = pkgs.python3Packages.pims;
  pytest = pkgs.python3Packages.pytest;
  pytorch = pkgs.python3Packages.pytorch;
  # not yet merged...
  # pytorch-lightning = pkgs.python3Packages.pytorch-lightning;
  pyyaml = pkgs.python3Packages.pyyaml;
  requests = pkgs.python3Packages.requests;
  # rpy2 = pkgs.python3Packages.rpy2; 
  scikitimage = pkgs.python3Packages.scikitimage;
  scikitlearn = pkgs.python3Packages.scikitlearn;
  scipy = pkgs.python3Packages.scipy;
  seaborn = pkgs.python3Packages.seaborn;
  tables = pkgs.python3Packages.tables;
  tensorflow = pkgs.python3Packages.tensorflow;
  tensorflow_avx2 = pkgs.python3Packages.tensorflow_avx2;
  tensorflow-probability = pkgs.python3Packages.tensorflow-probability;
  tifffile = pkgs.python3Packages.tifffile;
  torchvision = pkgs.python3Packages.torchvision;
  tqdm = pkgs.python3Packages.tqdm;
}
