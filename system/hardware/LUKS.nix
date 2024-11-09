{ ... }:

{
  # Optiplex 7040
  # options = {};
  # config = {};
  # TODO: Wrap in config/options and use systemSettings.host to choose
  # boot.initrd.luks.devices."luks-790d043b-cb5d-4347-baf8-3e81681045f8".device =
  #   "/dev/disk/by-uuid/790d043b-cb5d-4347-baf8-3e81681045f8";
  boot.initrd.luks.devices."luks-637f2ea7-ca67-4bf7-b4d2-c0d3dee28afb".device = "/dev/disk/by-uuid/637f2ea7-ca67-4bf7-b4d2-c0d3dee28afb";
}
