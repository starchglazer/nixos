{ self, ... }: {
  dandelion.profiles.barebones = {
    imports = [
      self.dandelion.modules.locale
      self.dandelion.modules.nix
      self.dandelion.modules.undetected
    ];
  };
}
