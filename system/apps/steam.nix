{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  # Will have to prefix executable with gamemoderun
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [ protonup ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/pharo/.steam/root/compatibilitytools.d";
  };
}
