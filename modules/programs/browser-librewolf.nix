{
  dandelion.modules.browser-librewolf = { pkgs, ... }: {
    programs.firefox = {
      package = pkgs.librewolf;
      enable = true;
    };
  };
}
