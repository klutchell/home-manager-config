let
  pkgs = import <nixpkgs> {};
  python = pkgs.python311;
  venvDir = "./.venv";
in
pkgs.mkShell {
  buildInputs = [ python ];
  
  shellHook = ''
    ${python}/bin/python -m venv ${venvDir}
    source ${venvDir}/bin/activate
    pip install gpt-review
  '';
}
