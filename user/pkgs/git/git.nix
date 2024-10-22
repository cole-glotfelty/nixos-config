{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Cole Glotfelty";
    userEmail = "git@postagepaid.cc";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
