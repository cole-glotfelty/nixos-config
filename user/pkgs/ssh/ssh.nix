{ ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host halligan
      User cglotf01
      HostName homework.cs.tufts.edu
      IdentityFile /home/pharo/.ssh/id_ed25519
      ServerAliveInterval 15
      Port 22
    '';
  };
}
