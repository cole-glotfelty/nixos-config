{ config, lib, pkgs, ... }:

with lib;
let cfg = config.features.cli.zsh;
in {
  options.features.cli.zsh.enable =
    mkEnableOption "enable extended ZSH configuration";
  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;

      # NOTE: Plugins removed atm potentially figuring out different 
      # installation method

      initExtra = ''
        bindkey '^ ' autosuggest-accept
      '';

      history = {
        size = 1000000;
        save = 1000000;
      };

      shellAliases = {
        "..." = "cd ../..";
        # TBD If I need this icon flags now
        ls = "${pkgs.eza}/bin/eza";
        ll = "${pkgs.eza}/bin/eza -l";
        la = "${pkgs.eza}/bin/eza -la";
        tree = "${pkgs.eza}/bin/eza -T";
        cat = "${pkgs.bat}/bin/bat";
      };

      profileExtra = ''
        export NIX_PATH=nixpkgs=channel:nixos-unstable
        export NIX_LOG=info
        export TERMINAL=kitty
        export EDITOR=nvim
      '';

      # NOTE: This is specific to hyprland. also, this will need to be tested
      loginExtra = ''
        if [[ $(tty) == "/dev/tty1" ]]; then
          exec Hyprland &> /dev/null
        fi
      '';
    };
  };
}
