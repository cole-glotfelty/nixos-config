{ config, lib, pkgs, ... }:

with lib;
let cfg = config.features.applications.browsers;
in {
  options.features.applications.browsers.enable =
    mkEnableOption "enable browser applications";
  config = mkIf cfg.enable {
    # TODO: expand on this config, should not have to change anything just sign in
    programs.firefox.enable = true;

    home.packages = with pkgs; [ ungoogled-chromium ];
  };
}
