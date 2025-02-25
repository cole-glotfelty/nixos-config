{ config, lib, inputs, pkgs, ... }:

with lib;
let cfg = config.features.cli.nixvim;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];

  options.features.cli.nixvim.enable =
    mkEnableOption "enable nixvim configuration";

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;

      # viAlias = true;
      # vimAlias = true; # this could cause problems
      # vimdiffAlias = true;

      luaLoader.enable = true;

      colorschemes.tokyonight = {
        enable = true;
        settings.style = "night";
      };
    };
  };
}
