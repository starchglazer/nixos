{ self, ... }: {
  dandelion.host.veradeon = { lib, pkgs, config, ... }:
  let
    pkgx = self.lib.mkPkgx' pkgs;
  in {
    imports = [
      # hardware
      self.dandelion.modules.amd

      # a common user's commonly shared profiles/dots
      self.dandelion.users.common
      self.dandelion.profiles.common
      # self.dandelion.dots.common          # <-- TODO: move common dots here soon

      # host specific profiles
      self.dandelion.profiles.gaming

      # host-specific dots
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
