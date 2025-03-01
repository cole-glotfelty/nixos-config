{ config, lib, ... }:

with lib;
let cfg = config.features.cli.nixvim;
in {
  config = mkIf cfg.enable {
    # TODO: See if AI can come up with a config for this that's sane
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
