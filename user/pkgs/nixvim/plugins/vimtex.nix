{ ... }:

# vimtex.nix
# Note: Potentially working on occasion (still issues)

{
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      settings = {
        compiler_method = "latexmk";
        latexmk_engines = { _ = "pdflatex"; };
        view_method = "zathura";
        viewer_options = [ "-sync" "-unique" ];
      };
    };
  };
}
