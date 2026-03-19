{ self, ... }: {
  dandelion.host.inspiron =
  let
    pkgx = self.lib.mkPkgx' pkgs;
  in {
    imports = [
      # host-specific hardware
      self.dandelion.modules.intel

      # a common user's commonly shared modules & dots within a common profile
      self.dandelion.users.common
      self.dandelion.profiles.common

      # host-specific profiles
      self.dandelion.profiles.gaming
      # self.dandelion.profiles.gnome

      # host-specific modules (+ optional dots)
      # self.dandelion.modules.<module-name>
      # self.dandelion.dots.<dot-name>
    ];

    networking.hostName = "inspiron";
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "24.05";

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/8161a374-4f4e-4c8a-a0df-80b2953295b7";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/802E-D891";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };
    };

    swapDevices = [
      { device = "/dev/disk/by-uuid/ee6f6f68-adef-4fdb-a96c-8c9dd5f7bae2"; }
    ];
  };
}
