{
  dandelion.modules.network = {
    networking = {
      nftables.enable = true;

      networkmanager = {
        enable = true;

        wifi = {
          powersave = false;
          macAddress = "random";
        };
      };

      firewall = {
        enable = true;

        allowedTCPPortRanges = [];
        allowedUDPPortRanges = [];
        trustedInterfaces = [];
      };
    };

    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
