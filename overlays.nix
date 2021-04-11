[
  # top-level pkgs overlays
  (self: super: {
    openmpi = super.openmpi.override { cudaSupport = true; };

    # batteries included :)
    ffmpeg = super.ffmpeg-full.override {
      nonfreeLicensing = true;
      nvenc = true; # nvidia support
    };

    ffmpeg-full = super.ffmpeg-full.override {
      nonfreeLicensing = true;
      nvenc = true; # nvidia support
    };

  })

  # python pkgs overlays
  (self: super: {

    blas = super.blas.override {
      blasProvider = self.mkl;
    };
    lapack = super.lapack.override {
      lapackProvider = self.mkl;
    };

    pythonOverrides = python-self: python-super: {
      pytorch = python-super.pytorch.override {
        openMPISupport = true;
        cudaSupport = true;
        buildNamedTensor = true;
        cudaArchList = [
          "5.0"
          "5.2"
          "6.0"
          "6.1"
          "7.0"
          "7.5"
          "7.5+PTX"
        ];
      };

      tensorflow = python-super.tensorflow.override {
        cudaSupport = true;
        cudatoolkit = super.cudatoolkit_10_1;
        cudnn = super.cudnn_cudatoolkit_10_1;
        # https://docs.nvidia.com/deeplearning/frameworks/tensorflow-user-guide/index.html
        cudaCapabilities = [
          "5.0"
          "5.2"
          "6.0"
          "6.1"
          "7.0"
          "7.5"
        ];
        sse42Support = true;
        avx2Support = false;
        fmaSupport = true;

      };

      tensorflow_avx2 = python-super.tensorflow.override {
        cudaSupport = true;
        cudatoolkit = super.cudatoolkit_10_1;
        cudnn = super.cudnn_cudatoolkit_10_1;
        # https://docs.nvidia.com/deeplearning/frameworks/tensorflow-user-guide/index.html
        cudaCapabilities = [
          "5.0"
          "5.2"
          "6.0"
          "6.1"
          "7.0"
          "7.5"
        ];
        sse42Support = true;
        avx2Support = true;
        fmaSupport = true;
      };

      opencv3 = python-super.opencv3.override {
        enableCuda = true;
        enableFfmpeg = true;
      };

      opencv4 = python-super.opencv4.override {
        enableCuda = true;
        enableFfmpeg = true;
      };
    };

    python3 =
      super.python3.override { packageOverrides = self.pythonOverrides; };

  })
]
