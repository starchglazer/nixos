{
  dandelion.modules.boot = { pkgs, ... }: {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;

      loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
        timeout = 0;
      };
    };
  };
}
