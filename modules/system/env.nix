{ config, self, ... }:
let
  inherit (self.lib) mkDotsModule;
  username = config.networking.hostName;
in {
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

  dandelion.dots.env = mkDotsModule username {

  };
}
