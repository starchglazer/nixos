{
  dandelion.modules.browser-zen = { pkgs, inputs, ... }: {
    environment.systemPackages =
    let
      system = pkgs.stdenv.hostPlatform.system;
      zen-browser = inputs.zen-browser.packages.${system}.default;
    in [
      zen-browser
    ];
  };
}
