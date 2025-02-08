{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ ffmpeg-full libva vulkan-loader ];

  hardware.nvidia.modesetting.enable = true;

  # Note on extra packages:
  # it's GPU specific this is for intel iGPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
    intel-vaapi-driver
    libvdpau-va-gl
  ];
}
