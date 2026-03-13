{
  dandelion.modules.wine = { pkgs, lib, config, ... }: {
    users.users = lib.genAttrs config.usernames.data.users (_user: {
      extraGroups = ["video" "input"];
    });

    boot.kernelModules = ["ntsync"];
    services.udev.extraRules = ''
      KERNEL=="ntsync", MODE="0644"
    '';

    environment.systemPackages = with pkgs; [
      wineWowPackages.waylandFull
      winetricks
      mono
    ];
  };
}
