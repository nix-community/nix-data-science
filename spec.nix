{ pkgs ? (import ./nixpkgs.nix), declInput }:
{
  jobsets = pkgs.runCommand "spec.json" {} ''
    cat <<EOF
    ${builtins.toXML declInput}
    EOF
    cat > $out <<EOF
    {
      "master": {
        "enabled": 1,
        "hidden": false,
        "description": "nix-data-science",
        "nixexprinput": "src",
        "nixexprpath": "release.nix",
        "checkinterval": 60,
        "schedulingshares": 100,
        "enableemail": true,
        "emailoverride": "",
        "keepnr": 10,
        "inputs": {
          "src": { "type": "git", "value": "file:///repo.git", "emailresponsible": true },
        }
      },
      "staging": {
        "enabled": 1,
        "hidden": false,
        "description": "nix-data-science",
        "nixexprinput": "src",
        "nixexprpath": "release.nix",
        "checkinterval": 60,
        "schedulingshares": 100,
        "enableemail": false,
        "emailoverride": "",
        "keepnr": 10,
        "inputs": {
          "src": { "type": "git", "value": "file:///repo.git", "emailresponsible": true },
        }
      }
    }
    EOF
  '';
}