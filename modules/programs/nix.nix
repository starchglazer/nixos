{ nixpkgs, ... }: {
  dandelion.modules.nix = { pkgs, ... }: let
    script = pkgs.writers.writeNuBin "activate" ''
      def main [systemConfig: string] {
        let diff_closure = ${pkgs.nix}/bin/nix store diff-closures /run/current-system $systemConfig;
        if $diff_closure != "" {
          let table = $diff_closure
          | lines
          | where $it =~ KiB
          | where $it =~ →
          | parse -r '^(?<Package>\S+): (?<Old_Version>[^,]+)(?:.*) → (?<New_Version>[^,]+)(?:.*, )(?<DiffBin>.*)$'
          | insert Diff {
            get DiffBin
            | ansi strip
            | str trim -l -c '+'
            | into filesize
          }
          | reject DiffBin
          | sort-by -r Diff;

          print $table;
          $table | math sum
        }
      }
    '';
  in {
    documentation.nixos.enable = false;
    nixpkgs.config.allowUnfree = true;

    nix = {
      registry.nixpkgs.flake = nixpkgs;
      channel.enable = false;

      settings = {
        allow-import-from-derivation = false;
        experimental-features = ["nix-command" "flakes"];
        auto-optimise-store = true;
        trusted-users = ["root" "@wheel"];
      };
    };

    system.activationScripts.diff = ''
      if [[ -e /run/current-system ]]; then
        ${script}/bin/activate "$systemConfig"
      fi
    '';
  };
}
