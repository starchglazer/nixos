{ self, ... }: {
  dandelion.profiles.development = {
    imports = [
      # modules
      self.dandelion.modules.direnv
      self.dandelion.modules.env
      self.dandelion.modules.editors

      # dots
      self.dandelion.dots.env
      self.dandelion.dots.editors
    ];
  };
}
