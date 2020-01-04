# Nix Data Science

This repository aims to define a set of packages for data-scientists with batteries-included. By using [Nix](https://nixos.org/nix/), the purely functional package manager, we strive to provide reproducible builds for the entire software stack, from low-level packages like glibc to high-level packages like PyTorch.

By using the same overlays (roughly "compilation flags" for those not versed in Nix) and by pinning nixpkgs to a particular SHA, we aim to improve the stability of the ecosystem and the ease-of-use by eventually providing access to a binary cache. This will greatly reduce the compilation burden and improve data scientist productivity.

Collaboration is encouraged! Feel free to create pull-requests or file an issue if you'd like to contribute.

## Design choices
Currently, the repository targets the Python ecosystem, and builds against Intel's MKL and NVIDIA's CUDA/cuDNN.

## Repo format
See https://www.reddit.com/r/NixOS/comments/8tkllx/standard_project_structure/ for more info.