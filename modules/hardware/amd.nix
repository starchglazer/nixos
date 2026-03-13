{
  dandelion.modules.amd = { pkgs, ... }: {
    environment.sessionVariables.RADV_PERFTEST = "video_decode";

    environment.systemPackages = [ pkgs.radeontop ];
    services.xserver.videoDrivers = [ "amdgpu" ];

    hardware.graphics = {
      extraPackages = with pkgs; [
        amdvlk
        rocmPackages.clr.icd
        vaapiVdpau
        libvdpau-va-gl
      ];

      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };

    # amd hip workaround
    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
}
