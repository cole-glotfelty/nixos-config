{ config, pkgs, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git = {
    enable = true;
    userName = "Cole Glotfelty";
    userEmail = "git@postagepaid.cc";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
