{
  dandelion.modules.proton = { pkgs, ... }: {
    environment = {
      etc."proton-ge".source = pkgs.proton-ge-bin.steamcompattool;

      sessionVariables = {
        "PROTON_ENABLE_WAYLAND" = 1;
        "PROTON_USE_WOW64" = 1;
        "PROTONPATH" = pkgs.proton-ge-bin.steamcompattool;
      };
    };

    programs.steam.extraCompatPackages = [pkgs.proton-ge-bin];
  };
}
