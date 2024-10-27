{ ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "FiraCode Nerd Font Mono";
    settings = {
      shell_integration = "no-cursor";
      cursor_shape = "block";
      cursor_blink_interval = 0;
      scrollback_lines = 10000;
      detect_urls = true;
    };
    # extraConfig = ''
    #   shell_integration no-cursor
    #   cursor_blink_interval 0
    #   cursor_shape block
    #   detect_urls yes
    #   scrollback_lines 2000
    # '';
  };
}
