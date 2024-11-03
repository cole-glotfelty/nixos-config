{ ... }:

{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      settings = {
        numhl = false;
        linehl = false;
        signs = {
          add = { text = "▎"; };
          change = { text = "▎"; };
          delete = { text = "_"; };
          topdelete = { text = "‾"; };
          changedelete = { text = "▎"; };
        };
      };
    };
  };
}
