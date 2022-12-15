{ pkgs, ... }:

let
  balena-production = pkgs.writeShellScriptBin "balena-production" ''
    unset AWS_PROFILE
    ${pkgs.aws-google-auth}/bin/aws-google-auth -p balena-production -r arn:aws:iam::491725000532:role/federated-admin
    export AWS_PROFILE="balena-production"
    ${pkgs.awscli2}/bin/aws --profile balena-production eks --region us-east-1 update-kubeconfig --name production-eks --alias production-eks
  '';

  balena-staging = pkgs.writeShellScriptBin "balena-staging" ''
    unset AWS_PROFILE
    ${pkgs.aws-google-auth}/bin/aws-google-auth -p balena-staging -r arn:aws:iam::567579488761:role/federated-admin
    export AWS_PROFILE="balena-staging"
    ${pkgs.awscli2}/bin/aws --profile balena-staging eks --region us-east-1 update-kubeconfig --name staging-eks --alias staging-eks
  '';

  balena-playground = pkgs.writeShellScriptBin "balena-playground" ''
    unset AWS_PROFILE
    ${pkgs.aws-google-auth}/bin/aws-google-auth -p balena-playground -r arn:aws:iam::240706700173:role/federated-admin
    export AWS_PROFILE="balena-playground"
    ${pkgs.awscli2}/bin/aws --profile balena-playground eks --region us-east-1 update-kubeconfig --name playground-eks --alias playground-eks
  '';
in
{
  home.packages = with pkgs; [
    awscli2
    aws-google-auth
    balena-production
    balena-staging
    balena-playground
    k9s
    kubectl
    # myPkgs.fluxctl
    kompose
  ];
}
