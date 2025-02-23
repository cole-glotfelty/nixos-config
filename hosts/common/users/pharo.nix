{ config, pkgs, inputs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pharo = {
    # TODO: move this to an agenix secret
    initialHashedPassword =
      "$y$j9T$.CYs5.FqH3ta1spc.eNcy0$cMQaz12yE8/U7JUeGWd0Wdon7HcDZOi3am09O6tolZ/";
    isNormalUser = true;
    description = "Cole Glotfelty";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "input"
      "plugdev"
      "uinput"
      "kvm"
      "qemu-libvirtd"
      "libvirtd"
      "flatpak"
    ];
    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  };
  home-manager.users.pharo =
    import ../../../home/pharo/${config.networking.hostName}.nix;
}
