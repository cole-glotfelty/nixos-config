{ pkgs, ... }:

{
  # Enable printing
  services.printing.enable = true;

  # Related to printing
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;
  environment.systemPackages = [ pkgs.cups-filters ];
}
