{ pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    # in the future make this set based on WM protocl
    package = pkgs.librewolf-wayland;
    settings = {
      "browser.search.defaultenginename" = "DuckDuckGo";
      "browser.search.defaultenginename.US" = "DuckDuckGo";
      "browser.search.defaultenginename.value" = "DuckDuckGo";
      "browser.search.order.1" = "DuckDuckGo";
    };
    # search = {
    #   force = true;
    #   default = "DuckDuckGo";
    #   order = [ "DuckDuckGo" "Google" ];
    # };
    # extraPolicies = { };
  };
}
