{ ... }:

{
  # Optiplex 7040
  # options = {};
  # config = {};
  # TODO: Wrap in config/options and use systemSettings.host to choose
  # boot.initrd.luks.devices."luks-790d043b-cb5d-4347-baf8-3e81681045f8".device =
  #   "/dev/disk/by-uuid/790d043b-cb5d-4347-baf8-3e81681045f8";
  boot.initrd.luks.devices."luks-783fb9b4-dca4-4c94-b06f-0963029dfe17".device =
    "/dev/disk/by-uuid/783fb9b4-dca4-4c94-b06f-0963029dfe17";
}
