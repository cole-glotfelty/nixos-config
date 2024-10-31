{ ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-cursor no-sudo";
    shellIntegration.enableZshIntegration = true;
    shellIntegration.enableBashIntegration = true;
    font.name = "FiraCode Nerd Font Mono";
    settings = {
      cursor_shape = "block";
      cursor_blink_interval = 0;
      scrollback_lines = 10000;
      detect_urls = true;
    };
  };
}
