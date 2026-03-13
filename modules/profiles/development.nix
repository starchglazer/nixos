{ self, ... }: {
  dandelion.profiles.development = {
    imports = [
      # self.dandelion.modules.code-editors
      self.dandelion.modules.direnv
      self.dandelion.modules.env
    ];
  };
}
