{ ... }:

{
  programs.nixvim = {
    plugins.indent-blankline = {
      enable = true;
      settings = {
        indent = { char = "┊"; };
        whitespace = { remove_blankline_trail = true; };
        scope = { enabled = false; };
        exclude = {
          buftypes = [ "terminal" "nofile" ];
          filetypes =
            [ "help" "startify" "dashboard" "packer" "neogitstatus" "Trouble" ];
        };
      };
    };
  };

}
