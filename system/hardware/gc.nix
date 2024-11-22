{ ... }:

{
  # Garbage Collection & Store Optimisation
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = [ "03:30" ];
    };
    settings.auto-optimise-store = true;
  };
}
