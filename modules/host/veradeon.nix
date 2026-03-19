{ self, ... }: {
  dandelion.host.veradeon =
  let
    pkgx = self.lib.mkPkgx' pkgs;
  in {
    imports = [
      # host-specific hardware
      self.dandelion.modules.amd

      # a common user's commonly shared modules & dots within a common profile
      self.dandelion.users.common
      self.dandelion.profiles.common

      # host specific profiles
      self.dandelion.profiles.gaming

      # host-specific modules (+ optional dots)
      # self.dandelion.modules.<module-name>
      # self.dandelion.dots.<dot-name>
    ];

    networking.hostName = "veradeon";
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "26.05";

    # TODO: Add correct file systems and swap devices.
    # I'm yet to buy and build the machine, so no UUIDs yet.
    fileSystems = {

    };

    swapDevices = [

    ];
  };
}
