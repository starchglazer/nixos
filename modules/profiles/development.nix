{ self, ... }: {
  dandelion.profiles.development = {
    imports = [
      self.dandelion.modules.direnv
      self.dandelion.modules.env
      self.dandelion.modules.editors
    ];
  };
}
