{
  dandelion.modules.browser-mullvad = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.mullvad-browser
    ];
  };
}
