{ self, ... }: {
  dandelion.profiles.common = {
    imports = [
      self.dandelion.profiles.barebones
      self.dandelion.profiles.development
      self.dandelion.profiles.workstation
    ];
  };
}
