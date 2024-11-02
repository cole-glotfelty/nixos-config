{ ... }:

{
  programs.nixvim = {
    plugins.autoclose = {
      enable = true;
      options = {
        disabledFiletypes = [ "text" "markdown" ];
        disableWhenTouch = true;
        disableCommandMode = true;
      };
    };
  };
}
