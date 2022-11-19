{ homeage, pkgs, config, ... }:

{
  home.packages = with pkgs; [
    age
  ];
  homeage = {
    # Absolute path to identity (created not through home-manager)
    identityPaths = [ "~/.ssh/id_ed25519" ];

    # "activation" if system doesn't support systemd
    installationType = "activation";

    mount = "/tmp/user/$UID/secrets";

    file."aws-config" = {
      # Path to encrypted file tracked by the git repository
      source = ../secrets/aws-config.age;
      symlinks = [ "${config.home.homeDirectory}/.aws/config" ];
    };
  };
}
