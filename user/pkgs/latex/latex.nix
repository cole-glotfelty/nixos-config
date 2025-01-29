{ pkgs, ... }:

# latex.nix
# This was the solution I Guess

{
  home.packages = with pkgs; [
    texliveFull
    texlivePackages.collection-latexextra
    texlivePackages.collection-basic
    texlivePackages.collection-latex
    texlivePackages.collection-mathscience
    texlivePackages.collection-music
    texlivePackages.collection-latexrecommended
    texlivePackages.collection-fontsrecommended
    texlivePackages.collection-fontsextra
    texlivePackages.collection-langcjk
    texlivePackages.collection-pictures
    texlivePackages.collection-langgreek
    texlivePackages.collection-publishers
    texlivePackages.collection-langenglish
  ];

  # home.packages = with pkgs; [ pkgs.texlive.combined.scheme-full ];

  # Not sure why this method gets an error
  # programs.texlive = {
  #   enable = true;
  #   # packageSet = pkgs.texliveFull;
  #   # packageSet = pkgs.texliveFull;
  #   extraPackages = tpkgs: {
  #     inherit (tpkgs) collection-latexextra collection-basic collection-latex;
  #   };
  # };
}
