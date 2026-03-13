{ self, ... }: {
  dandelion.profiles.gaming = {
    imports = [
      self.dandelion.modules.heroic
      self.dandelion.modules.proton
      self.dandelion.modules.steam
      self.dandelion.modules.wine
    ];
  };
}
