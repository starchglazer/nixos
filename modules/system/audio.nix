{
  dandelion.modules.audio = {
    security.rtkit.enable = true;

    services = {
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = false;
      pipewire.enable = true;
      pulse.enable = true;
      pulseaudio.enable = false;
      wireplumber.enable = true;
    };
  };
}
