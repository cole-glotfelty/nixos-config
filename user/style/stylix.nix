{ inputs, config, pkgs, ... }:

{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  # home.file.".local/share/fonts/AppleColorEmoji.ttf".source =
  #   "${inputs.apple-emoji}/fonts/AppleColorEmoji.ttf";
  #
  # home.activation.fonts = inputs.home-manager.lib.hm.dag.entryAfter [ "linkGeneration" ] ''
  #   fc-cache -fv
  # '';

  stylix = {
    enable = true;
    image = ./wallpaper.png;
    polarity = "dark";
    autoEnable = false;
    # fonts = {
    #   # emoji = {
    #   #   # package = pkgs.fonts.apple-emoji;
    #   #   name = "Apple Color Emoji";
    #   # };
    #   monospace = {
    #     package = pkgs.nerd-fonts.fira-code;
    #     name = "FiraCode Nerd Font Mono";
    #   };
    # };
  };
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ''+config.stylix.image+''

    wallpaper = ,''+config.stylix.image+''
    '';
}
