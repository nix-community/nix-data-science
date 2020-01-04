{ nixpkgs, declInput }:
let 
  pkgs = import nixpkgs {};
  # TODO read all files in directory, and concatenate strings
  helloJson = builtins.readFile ./specs/hello.json;
in {
  jobsets = pkgs.runCommand "spec.json" {} ''
    cat <<EOF
    ${builtins.toXML declInput}
    EOF
    cat > $out <<EOF
    ${helloJson}
    EOF
  '';
}