{ config, lib, pkgs, ... }:

with lib;
let cfg = config.features.applications.browsers;
in {
  options.features.applications.browsers.enable =
    mkEnableOption "enable browser applications";
  config = mkIf cfg.enable {
    # TODO: expand on this config, should not have to change anything just sign in
    # TODO: figure out why slides lags and freezes
    programs.firefox = {
      enable = true;
      profiles.default = {
        settings = {
          "gfx.font_rendering.opentype_svg.enabled" = true;
          "layout.css.font-visibility.level" = 1; # Improve web font rendering
        };
      };
    };

    home.sessionVariables = { BROWSER = "firefox"; };

    home.packages = with pkgs; [ ungoogled-chromium ];
  };
}
