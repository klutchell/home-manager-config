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
      ${pkgs.aws-google-auth}/bin/aws-google-auth -p balena-staging -r arn:aws:iam::567579488761:role/federated-admin
      export AWS_PROFILE="balena-staging"
      ${pkgs.awscli2}/bin/aws --profile balena-staging eks --region us-east-1 update-kubeconfig --name staging-eks --alias staging-eks
      echo "Environment set to balena-staging!"
    '';
}
