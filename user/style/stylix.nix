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
    # image = ./wallpaper.png;
    image = ./wallpaper.jpg;
    polarity = "dark";
    autoEnable = false;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    fonts = {
      # emoji = {
      #   # package = pkgs.fonts.apple-emoji;
      #   name = "Apple Color Emoji";
      # };
      # serif = {
      #   package = pkgs.corefonts;
      #   name = "Times New Roman";
      # };
      # sansSerif = {
      #   package = pkgs.liberation_ttf;
      #   name = "Liberation Sans";
      # };
      # monospace = {
      #   package = pkgs.nerd-fonts.fira-code;
      #   name = "FiraCode Nerd Font Mono";
      # };
    };
  };

  stylix.targets.kitty = { enable = false; };

  stylix.targets.fuzzel = { enable = false; };

  home.file.".config/hypr/hyprpaper.conf" = {
    text = "preload = " + config.stylix.image + ''

      wallpaper = ,'' + config.stylix.image + "";
  };

  fonts.fontconfig.defaultFonts = {
    monospace = [ "FiraCode Nerd Font Mono" ];
    sansSerif = [ "Liberation Sans" ];
    serif = [ "Times New Roman" ];
  };
}
