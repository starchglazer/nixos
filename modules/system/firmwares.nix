{
  dandelion.modules.firmwares = {
    # uncategorized
    services.thermald.enable = true;
    services.fwupd.enable = true;

    # extra firmwares
    hardware.enableAllFirmware = true;
    hardware.steam-hardware.enable = true;
  };
}
