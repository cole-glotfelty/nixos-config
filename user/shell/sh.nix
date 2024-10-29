{ pkgs, ... }:

let
  myAliases = {
    ls = "eza --icons";
    ll = "eza -l --icons";
    la = "eza -la --icons";
    tree = "eza -T --icons";
    cat = "bat";
  };

in

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;

    initExtra = ''
    bindkey '^ ' autosuggest-accept
    '';

    history = {
      size = 1000000;
      save = 1000000;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    eza bat
  ];
}
