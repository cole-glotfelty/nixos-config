{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ ffmpeg-full libva vulkan-loader ];

  # Note on extra packages:
  # it's GPU specific this is for intel iGPU
  hardware.graphics.enable = true;

  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
    intel-vaapi-driver
    libvdpau-va-gl
  ];
}
