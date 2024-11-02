{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true; # this could cause problems
    vimdiffAlias = true;

    luaLoader.enable = true;

    colorschemes.tokyonight = {
        enable = true;
        settings.style = "night";
    };
  };
}
