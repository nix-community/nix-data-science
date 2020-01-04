# Nix Data Science

This repository aims to define a standard set of packages and overlays for data-scientists. By using [Nix](https://nixos.org/nix/), the purely functional package manager, we strive to provide reproducible builds for the entire software stack, from low-level packages like glibc to high-level packages like PyTorch.

By using the same overlays (roughly "compilation flags" for those not versed in Nix) and by pinning nixpkgs to a particular SHA, we aim to improve the stability of the ecosystem and the ease-of-use by eventually providing access to a binary cache. This will greatly reduce the compilation burden and improve data scientist productivity.

Collaboration is encouraged! Feel free to create pull-requests or file an issue if you'd like to contribute.

## Repo format
See https://www.reddit.com/r/NixOS/comments/8tkllx/standard_project_structure/ for more info.