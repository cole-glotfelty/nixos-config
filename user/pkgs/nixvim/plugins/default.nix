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
    # extraPlugins = with pkgs.vimPlugins; [{
    #   plugin = neodev-nvim;
    #   config = ''lua require("neodev").setup()'';
    # }];
    extraPlugins = with pkgs.vimPlugins; [
      neodev-nvim
      (pkgs.vimUtils.buildVimPlugin {
        pname = "erlang-skeletons";
        version = "2024-02-20"; # Use latest date or version
        src = pkgs.fetchFromGitHub {
          owner = "EliasA5";
          repo = "erlang-skeletons";
          rev = "e117222abaf863258617a1804c0c9c1a49f70d7b";
          sha256 =
            "sha256-g18guEJW5/VSwo5ApS7gKawWjz/rd3zewYyz6d/OJCg="; # Use lib.fakeSha256 first
        };
      })
    ];
    extraConfigLua = ''
      require("neodev").setup()
      require('erlang-skeletons').setup()
    '';
  };
}
