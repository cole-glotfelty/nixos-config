{ pkgs, ... }:

let
  myAliases = {
    ls = "${pkgs.eza}/bin/eza --icons";
    ll = "${pkgs.eza}/bin/eza -l --icons";
    la = "${pkgs.eza}/bin/eza -la --icons";
    tree = "${pkgs.eza}/bin/eza -T --icons";
    cat = "${pkgs.bat}/bin/bat";
  };

in

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;

    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-autosuggestions"
        "zap-zsh/supercharge"
        "zap-zsh/atmachine-prompt"
        "zsh-users/zsh-syntax-highlighting"
      ];
    };

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
}
