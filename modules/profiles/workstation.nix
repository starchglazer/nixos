{ self, ... }: {
  dandelion.profiles.workstation = {
    imports = [
      self.dandelion.modules.audio
      self.dandelion.modules.boot
      self.dandelion.modules.bluetooth
      self.dandelion.modules.firmwares
      self.dandelion.modules.fonts
      self.dandelion.modules.graphics
      self.dandelion.modules.network

      self.dandelion.modules.hjem
      self.dandelion.modules.hjem-impure

      self.dandelion.modules.browsers
      # self.dandelion.modules.office
    ];
  };
}
