{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kyle";
  home.homeDirectory = "/Users/kyle";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.bash
    pkgs.coreutils
    pkgs.git-crypt
    pkgs.gnugrep
    pkgs.hadolint
    pkgs.htop
    pkgs.jq
    pkgs.neofetch
    pkgs.nixpkgs-fmt
    pkgs.ripgrep
    pkgs.shellcheck
    pkgs.wget
    pkgs.yq-go
    pkgs.yadm
    (pkgs.callPackage ./balena-cli.nix {
      version = "15.0.3";
      hash = "11dnilgj6xfq20420nmf3dy9zry6sy7gahkvdx1fa701d89di3a3";
    })
    (pkgs.callPackage ./chatgpt-shell-cli.nix {})
  ];

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
    enableGitCredentialHelper = true;
  };

  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gpg = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
