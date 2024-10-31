{ pkgs, ... }:

{
  # Note on extra packages:
  # it's GPU specific this is for intel iGPU
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [ intel-compute-runtime ];
}
