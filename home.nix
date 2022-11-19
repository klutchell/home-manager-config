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

  home.packages = with pkgs; [
    bash
    git-crypt
    hadolint
    htop
    jq
    neofetch
    nixpkgs-fmt
    shellcheck
    yq-go
    yadm
  ];

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };

  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gpg = {
    enable = true;
  };
}
