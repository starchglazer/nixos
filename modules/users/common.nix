{ config, self, ... }:
let
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
}
