{ nixpkgs, declInput }:
let
  pkgs = import nixpkgs { };

  mkJobset =
    { nixpkgsRelease
    , nixFile
    , descriptionNote
    }: {
      enabled = 1;
      hidden = false;
      description = "nix-data jobset for nixpkgs branch ${nixpkgsRelease} (${descriptionNote})";
      nixexprinput = "src";
      nixexprpath = "jobsets/${nixFile}";
      checkinterval = 300;
      schedulingshares = 100;
      enableemail = false;
      emailoverride = "";
      keepnr = 3;
      type = 0; # Non-flake (legacy)
      inputs = {
        src = {
          type = "git";
          value = "git://github.com/nix-community/nix-data.git";
          emailresponsible = false;
        };
        nixpkgs = {
          type = "git";
          value = "git://github.com/NixOS/nixpkgs.git ${nixpkgsRelease}";
          emailresponsible = false;
        };
      };
    };

  jobsets = {
    "hello-20.09" = mkJobset {
      nixpkgsRelease = "nixos-20.09";
      nixFile = "r.nix";
      descriptionNote = "r";
    };

    hello-unstable = mkJobset {
      nixpkgsRelease = "nixos-unstable";
      nixFile = "hello.nix";
      descriptionNote = "hello";
    };

    "python-20.09" = mkJobset {
      nixpkgsRelease = "nixos-20.09";
      nixFile = "python.nix";
      descriptionNote = "python";
    };

    python-unstable = mkJobset {
      nixpkgsRelease = "nixos-unstable";
      nixFile = "python.nix";
      descriptionNote = "python";
    };

    "r-20.09" = mkJobset {
      nixpkgsRelease = "nixos-20.09";
      nixFile = "r.nix";
      descriptionNote = "r";
    };

    r-unstable = mkJobset {
      nixpkgsRelease = "nixos-unstable";
      nixFile = "r.nix";
      descriptionNote = "r";
    };
  };

in
{
  jobsets = pkgs.runCommand "spec.json" { } ''
    cat <<EOF
    ${builtins.toXML declInput}
    EOF
    cat > spec.json <<EOF
    ${builtins.toJSON jobsets}
    EOF

    cat spec.json | ${pkgs.jq}/bin/jq -r . > $out

  '';
}
