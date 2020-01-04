{ nixpkgs, declInput }:
let 
  pkgs = import nixpkgs {};

  # function to remove numChars from end of string
  strip = numChars: string: 
    builtins.substring 0 (builtins.stringLength string - numChars) string;

  # strip .nix from filenames in jobsets/*
  jobsetNames = builtins.map
    (strip 4) (builtins.attrNames (builtins.readDir ./jobsets));
  
  # create spec.json for each jobset
  # strip trailing comma + newline
  specs = (strip 2 (builtins.foldl' (acc: name: acc +
    ''
      "${name}": {
        "enabled": 1,
        "hidden": false,
        "description": "js",
        "nixexprinput": "src",
        "nixexprpath": "jobsets/${name}.nix",
        "checkinterval": 60,
        "schedulingshares": 5,
        "enableemail": false,
        "emailoverride": "",
        "keepnr": 3,
        "inputs": {
          "src": { "type": "git", "emailresponsible": false,
            "value": "git://github.com/tbenst/nix-data-science.git"
          }
        }
      },
    '') "{" jobsetNames)) + "}";
in {
  jobsets = pkgs.runCommand "spec.json" {} ''
    cat <<EOF
    ${builtins.toXML declInput}
    EOF
    cat > $out <<EOF
    ${specs}
    EOF
  '';
}