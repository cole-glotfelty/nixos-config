{ ... }:

# vimtex.nix
# Note: Potentially working on occasion (still issues)

# <leader> ll : compile start/stop
# <leader> lk : stop compilation
# <leader> lc : clear auxiliary files a la `latexmk -C`
# <leader> li : view system commands executing compiler
# <leader> lo : inspect compiler output

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
