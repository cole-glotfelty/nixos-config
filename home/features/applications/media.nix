{ config, lib, pkgs, ... }:

with lib;
let cfg = config.features.applications.media;
in {
  options.features.applications.media.enable =
    mkEnableOption "enable media applications";
  config = mkIf cfg.enable {
    # TODO: Come back, bc some of thesse may require themeing or the such
    home.packages = with pkgs; [
      foliate #epub reader
      zathura #pdf viewer
      mpv #video player
      feh #image viewer
      qbittorrent #torrent client # NOTE: TBD on this as a torrent client
      cmus # music player # NOTE: potenitally replace with MPD and Client
      yt-dlp # webvideo downloading
      plex # personal streamed media
      cider # apple music client (electron bleh)
    ];
  };
}
