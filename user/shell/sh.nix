{ pkgs, ... }:

let
  myAliases = {
    ls = "eza";
    ll = "eza -l";
    la = "eza -la";
    tree = "eza -T";
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

    initExtra = "bindkey '^ ' autosuggest-accept";

    history = {
      size = 1000000;
      save = 1000000;
    };

    zplug = {
      enable = true;
      plugins = [
	{ name="zsh-users/zsh-autosuggestions"; }
	{ name="zsh-users/zsh-syntax-highlighting"; }
	{ name="zap-zsh/completions"; }
	{ name="zap-zsh/supercharge"; }
	{ name="zap-zsh/atmachine-prompt"; }
      ];
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
