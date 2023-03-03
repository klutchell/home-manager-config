{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;

    ignores = [
      ".DS_Store"
      "*.pyc"
      "node_modules/"
      ".envrc"
      ".direnv/"
    ];

    userName = "Kyle Harding";
    userEmail = "kyle@balena.io";
    signing.signByDefault = true;
    signing.key = "FD3EB16D2161895A";

    extraConfig = {
      core = {
        editor = "nano";
      };
      color = {
        ui = true;
      };
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      pull = {
        ff = "only";
        rebase = true;
      };
      init = {
        defaultBranch = "main";
      };
      sendemail = {
        from = "Kyle Harding <kyle@balena.io>";
        chainreplyto = false;
        smtpencryption = "tls";
        smtpserver = "smtp.gmail.com";
        smtpserverport = 587;
        smtpuser = "kyle@balena.io";
      };
    };
  };
}
