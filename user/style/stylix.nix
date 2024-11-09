{ inputs, config, ... }:

{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  stylix = {
    enable = true;
    image = ./wallpaper.png;
    polarity = "dark";
    autoEnable = false;
  };
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ''+config.stylix.image+''

    wallpaper = ,''+config.stylix.image+''
    '';
}
