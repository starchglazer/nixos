{
  dandelion.modules.env = { pkgs, ... }: {
    environment = {
      systemPackages = with pkgs; [
        git
        vim
      ];

      variables.EDITOR = "vim";
      sessionVariables.NIXOS_OZONE_WL = "1";
    };
  };
}
