# Nix for Data Science

This repository aims to define a set of packages for data-scientists with batteries-included. By using [Nix](https://nixos.org/nix/), the purely functional package manager, we strive to provide reproducible builds for the entire software stack, from low-level packages like glibc to high-level packages like PyTorch.

By using the same overlays (roughly "compilation flags" for those not versed in Nix) and by pinning nixpkgs to a particular SHA, we aim to improve the stability of the ecosystem and the ease-of-use by eventually providing access to a binary cache. This will greatly reduce the compilation burden and improve data scientist productivity.

Collaboration is encouraged! Feel free to create pull-requests or file an issue if you'd like to contribute.

## Focus
Currently, the repository targets the Python & R ecosystem, and builds against Intel's MKL and NVIDIA's CUDA/cuDNN. Please get in touch if you would like to add focus areas!

## Get in touch

Join the [nix-data Slack workspace](https://join.slack.com/t/nix-data/shared_invite/zt-ca8csgcz-N9Fyh~tnoZPY8x5lE_slFA).

## Repo format
See https://www.reddit.com/r/NixOS/comments/8tkllx/standard_project_structure/ for more info.
