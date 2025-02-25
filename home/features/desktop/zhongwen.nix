{ config, lib, pkgs, ... }:

with lib;
let cfg = config.features.desktop.zhongwen;
in {
  options.features.desktop.zhongwen.enable =
    mkEnableOption "enable zhongwen input via fcitx5";

  config = mkIf cfg.enable {
    # TODO: maybe this works better is it's a system level config?
    # TODO: I think I need to enable fcit5 system level and then I can add addons here
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        fcitx5-skk-qt
        fcitx5-rime
        fcitx5-chinese-addons
      ];
    };

  };
}
