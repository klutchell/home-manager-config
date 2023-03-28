# https://github.com/pipex/nixpkgs/blob/macbook/balena-cli.nix
{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation rec {
  pname = "chatgpt-shell-cli";
  version = "f33fe3752f44515b6ba68a0a7dbd892f36a60580";

  src = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/0xacx/chatGPT-shell-cli/${version}/chatgpt.sh";
    sha256 = "sha256-wP8f0Uinw20Tj/f654KTp4V61g/3NyXbXo2EOWINAUk=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -D $src $out/bin/chatgpt
    runHook postInstall
  '';
}
