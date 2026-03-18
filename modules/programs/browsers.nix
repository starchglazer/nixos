{ self, ... }: {
  dandelion.modules.browsers = {
    imports = [
      # self.dandelion.modules.browser-librewolf
      self.dandelion.modules.browser-mullvad
      self.dandelion.modules.browser-zen
    ];
  };
}
