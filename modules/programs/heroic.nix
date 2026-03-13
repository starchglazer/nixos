{ self, ... }: {
  dandelion.modules.heroic = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.heroic-unwrapped.legendary
    ];
  };
}
