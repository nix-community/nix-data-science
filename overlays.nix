[
  # top-level pkgs overlays
  (self: super: {
    magma = super.magma.override {
      mklSupport = true;
    };

    openmpi = super.openmpi.override {
      cudaSupport = true;
    };

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
  
    pythonOverrides = python-self: python-super: {
      numpy = python-super.numpy.override { blas = super.mkl; };
      
      pytorch = python-super.pytorch.override {
          mklSupport = true;
          openMPISupport = true;
          cudaSupport = true;
          buildNamedTensor = true;
      };

      tensorflow = python-super.tensorflow.override {
        cudaSupport = true;
        cudatoolkit = super.cudatoolkit_10_1;
        cudnn = super.cudnn_cudatoolkit_10_1;
        # TODO specify or caching will fail
        # sse42Support = 
        # avx2Support = 
        # fmaSupport = 
      };

      opencv3 = python-super.opencv3.override {
          enableCuda = true;
          enableFfmpeg = true;
      };
    };

    python3 = super.python3.override {packageOverrides = self.pythonOverrides;};
  
  })
]