{ self, nixpkgs, systems, ... }:
let
  inherit (nixpkgs.lib) getAttrs mapAttrs isFunction;
  inherit (self.lib) mkPkgx;
in {
  lib = {
    mkPkgx = system: self.packages.${system};
    mkPkgx' = pkgs: mkPkgx pkgs.stdenv.hostPlatform.system;
    pkgsFor = getAttrs (import systems) nixpkgs.legacyPackages;
    eachSystem = fn: mapAttrs (system: pkgs: let pkgx = mkPkgx system; in fn { inherit system pkgs pkgx; }) self.lib.pkgsFor;
    mkDotsModule = username: dots: { config, pkgs, lib, ... }:
    let
      inherit (self.packages.${pkgs.stdenv.hostPlatform.system}) sources;
      inherit (config.hjem.users.${username}.impure) dotsDir;

      args = { inherit lib config sources dotsDir; };
      normalize = dot: {
        source =
          if isFunction dot
          then dot args
          else dotsDir + dot;
      };
    in {
      hjem.users.${username}.xdg.config.files = mapAttrs (_: normalize) dots;
    };
  };
}
