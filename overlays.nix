[
  (self: super: {
  
    pythonOverrides = python-self: python-super: {
      opencv3 = python-super.opencv3.override {
          enableCuda = true;
          enableFfmpeg = true;
      };
    };

    python37 = super.python37.override {packageOverrides = self.pythonOverrides;};

    ffmpeg = super.ffmpeg-full.override {
      nonfreeLicensing = true;
      nvenc = true; # nvidia support
    };

    ffmpeg-full = super.ffmpeg-full.override {
      nonfreeLicensing = true;
      nvenc = true; # nvidia support
    };
  
  })
]