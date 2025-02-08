{ inputs, ... }:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    # image = ./wallpaper.png;
    image = ./wallpaper.jpg;
    polarity = "dark";
  };
}
