{ config, self, ... }:
let
  inherit (self.lib) mkDotsModule;
  username = config.networking.hostName;
in {
  dandelion.users.common = { pkgs, lib, ... }: {
    # Single source of truth, where: hostName == username.
    config = {
      usernames.data.users = lib.mkDefault [ username ];

      # Prevents drift, but might be unnecessary.
      assertions = [
        {
          assertion = username != "";
          message = "`networking.hostName` must be set (it is used as the primary username).";
        }
        {
          assertion = config.usernames.data.users == [ username ];
          message = "This setup enforces a single user whose name matches `networking.hostName`. Expected `usernames.data.users == [${username}]`.";
        }
      ];

      users.users.${username} = {
        description = lib.mkDefault username;
        shell = pkgs.fish;
        isNormalUser = true;
        name = username;
        initialPassword = lib.mkDefault username;

        extraGroups = [
          "networkmanager"
          "wheel"
          "multimedia"
        ];

        packages = with pkgs; [
          git
          vim
        ];
      };

      hjem.users.${username} = {
        enable = true;
        user = username;
        directory = config.users.users.${username}.home;
        clobberFiles = lib.mkForce true;

        impure = {
          enable = true;
          dotsDir = "${self.paths.dots}";
          dotsDirImpure = "/home/${username}/nixos/dots";
          parseAttrs = [
            config.hjem.users.${username}.xdg.config.files
            config.hjem.users.${username}.xdg.state.files
          ];
        };
      };
    };
  };

  # Being able to nix freely,
  # @Rexcrazy804 has spawned horrors upon this world.
  # At least, he says he is sorry; but I doubt it.

  # dandelion.dots.cli = args@{ config, ... }: (mkDotsModule username {
  #   "git/config" = "/git/config";
  # }) args;

  # dandelion.dots.gui = args@{ config, ... }: (mkDotsModule username {
  #   "uwsm/env" = "/uwsm/env";
  #   "qt6ct/qt6ct.conf" = "/qt6ct/qt6ct.conf";
  #   "gtk-4.0/settings.ini" = "/gtk/gtk4.ini";
  # }) args;

  # dandelion.dots.mango = args@{ config, ... }: (mkDotsModule username {
  #   "mango/config.conf" = "/mango/config.conf";
  #   "mango/autostart.sh" = "/mango/autostart.sh";
  #   "mango/hardware.conf" = d: d.dotsDir + "/mango/${d.lib.toLower d.config.networking.hostName}.conf";
  # }) args;

  # dandelion.dots.hypr = args@{ config, ... }: (mkDotsModule username {
  #   "hypr/hyprland.conf" = "/hyprland/hyprland.conf";
  # }) args;
}
