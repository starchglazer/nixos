{
  dandelion.modules.fonts = { pkgs, ... }: {
    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;

      # Idrk why I have lots of fonts, but I do.
      # Prolly because libreoffice/openoffice being
      # fucked without some of them, but whatever.
      packages = with pkgs; [
        freefont_ttf liberation_ttf gyre-fonts roboto unifont

        comic-neue corefonts dejavu_fonts inter lato lexend noto-fonts
        noto-fonts-cjk-sans work-sans

        noto-fonts-color-emoji openmoji-color openmoji-black twemoji-color-font

        nerd-fonts.dejavu-sans-mono nerd-fonts.droid-sans-mono
        nerd-fonts.jetbrains-mono

        nerd-fonts.symbols-only material-symbols
      ];
    };
  };
}
