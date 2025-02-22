# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Maybe fixes youtube/firefox's weirdness
  boot.kernelParams = [ "intel_pstate=active" "vm.swappiness=10" ];
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # NOTE: Also in hardware config so maybe unneeded
  boot.initrd.luks.devices."luks-637f2ea7-ca67-4bf7-b4d2-c0d3dee28afb".device =
    "/dev/disk/by-uuid/637f2ea7-ca67-4bf7-b4d2-c0d3dee28afb";

  # Enable Networking
  networking.hostName = "casper";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # i18n.inputMethod = {
  #   # enable = "fcitx5";
  #   enable = true;
  #   type = "fcitx5";
  #   fcitx5 = {
  #     waylandFrontend = true;
  #     addons = with pkgs; [
  #       fcitx5-gtk
  #       fcitx5-skk-qt
  #       fcitx5-rime
  #       fcitx5-chinese-addons
  #     ];
  #   };
  # };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    git
    nixd # nix LSP
  ];

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    allowSFTP = true;
  };

  # ZSH Default Shell
  programs.zsh.enable = true;
  # environment.shells = with pkgs; [ zsh bash ];
  # users.defaultUserShell = pkgs.zsh;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # Unfuck this part
    configPackages = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
