# shell.nix
{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.awscli2
    pkgs.aws-google-auth
    pkgs.k9s
    pkgs.kubectl
    pkgs.arkade
  ];

  shellHook =
    ''
      unset AWS_PROFILE
      ${pkgs.aws-google-auth}/bin/aws-google-auth -p balena-playground -r arn:aws:iam::240706700173:role/federated-admin -R us-east-1 -I C04e1utuw -S 447476946884 -k --bg-response None -l debug
      export AWS_PROFILE="balena-playground"
      ${pkgs.awscli2}/bin/aws --profile balena-playground eks --region us-east-1 update-kubeconfig --name playground-eks --alias playground-eks
      echo "Environment set to balena-playground!"
    '';
}
