{ ... }:

{
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
}
