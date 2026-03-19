{ self, ... }: {
  dandelion.modules.browsers = { inputs, pkgs, ... }:
  let
    system = pkgs.stdenv.hostPlatform.system;
    zen-browser = inputs.zen-browser.packages.${system}.default;
  in {
    programs.firefox = {
      package = pkgs.librewolf;
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      mullvad-browser
      zen-browser
    ];
  };
}
