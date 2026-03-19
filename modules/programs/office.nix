{ self, ... }: {
  dandelion.modules.office = {
    environment.systemPackages = with pkgs; [
      # libreoffice
      obsidian
      onlyoffice-desktopeditors
      pandoc
    ];
  };
}
