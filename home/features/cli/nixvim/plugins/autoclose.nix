{ config, lib, ... }:

with lib;
let cfg = config.features.cli.nixvim;
in {
  config = mkIf cfg.enable {
    programs.nixvim = {
      plugins.autoclose = {
        enable = true;
        settings = {
          options = {
            disabledFiletypes = [ "text" "markdown" ];
            disableWhenTouch = true;
            disableCommandMode = true;
          };
        };
      };
    };
  };
}
