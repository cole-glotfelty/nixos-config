{ pkgs, ... }:

{
  # Note on extra packages:
  # it's GPU specific this is for intel iGPU
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [ intel-compute-runtime ];
}
