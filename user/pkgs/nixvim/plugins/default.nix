{ pkgs, ... }:

# Plugins.nix
{
  imports = [
    ./indent-blankline.nix
    ./lsp.nix
    ./gitsigns.nix
    ./cmp.nix
    ./autoclose.nix
    ./treesitter.nix
    ./vimtex.nix
    ./telescope.nix
  ];

  programs.nixvim = {
    plugins = {
      bufferline.enable = true;
      fugitive.enable = true;
      undotree.enable = true;
      vim-bbye.enable = true;
      comment.enable = true;
      todo-comments.enable = true;
      nix.enable = true;
      web-devicons.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [{
      plugin = neodev-nvim;
      config = ''lua require("neodev").setup()'';
    }];
  };
}
