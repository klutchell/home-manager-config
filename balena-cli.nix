# https://github.com/pipex/nixpkgs/blob/macbook/balena-cli.nix
{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation rec {
  pname = "balena-cli";
  version = "15.2.0";
  hash = "sha256-eW6WtS4BMvQDJ9zEJWniXZVqfHPD2N0NZt90dBfhxBI=";

  src = pkgs.fetchzip {
    url = "https://github.com/balena-io/balena-cli/releases/download/v${version}/balena-cli-v${version}-macOS-x64-standalone.zip";
    sha256 = "${hash}";
  };

  installPhase = ''
    mkdir -p $out/balena-cli
    mkdir -p $out/bin 
    cp -r * $out/balena-cli
    ln -s $out/balena-cli/balena $out/bin/balena 
  '';
}
