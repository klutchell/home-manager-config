{ stdenv, python3 }:

stdenv.mkDerivation rec {
  name = "gpt-review-venv";

  nativeBuildInputs = [ python3 ];

  phases = [ "installPhase" ];

  installPhase = ''
    ${python3}/bin/python -m venv $out
    $out/bin/pip install gpt-review

    # Assume the binary installed by gpt-review is named 'gpt'
    # Rename it to avoid conflict with the system 'gpt' command
    mv $out/bin/gpt $out/bin/gpt-review
  '';
}
