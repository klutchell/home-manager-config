{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    autocd = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "docker"
        "gh"
        "git"
        "direnv"
      ];
      theme = "robbyrussell";
    };

    shellAliases = {
      ll = "ls -l";
      hms = "home-manager switch";
      gpt-review = "CONTEXT_FILE=${config.home.homeDirectory}/azure.yaml OPENAI_API_KEY=$(cat ${config.home.homeDirectory}/.openai_pat) gpt-review";
    };

    localVariables = {
      TZ = "America/Toronto";
      EDITOR = "nano";
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
    ];
  };
}
