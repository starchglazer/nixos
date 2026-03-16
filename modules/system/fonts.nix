{
  dandelion.modules.fonts = { pkgs, ... }: {
    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;

      # There are unmentioned packages I previously had/still have
      # that had font issues or were completely fucked without some of these.
      #
      # Apparently, only-office is also completely fucked without some of these.
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/on/onlyoffice-desktopeditors/package.nix#L61-L66
      packages = with pkgs; [
        # These were added to fix aforementioned font issues as well as
        # to add core fonts / emoji fonts for better compatibility.
        freefont_ttf liberation_ttf vista-fonts corefonts unifont noto-fonts noto-fonts-cjk-sans
        noto-fonts-color-emoji openmoji-color openmoji-black twemoji-color-font

        # Only added for ricing to match design systems, personal use, or just because I like them.
        comic-neue dejavu_fonts dm-sans gyre-fonts inter lato lexend roboto work-sans
        nerd-fonts.dejavu-sans-mono nerd-fonts.droid-sans-mono nerd-fonts.jetbrains-mono
        nerd-fonts.symbols-only material-symbols
      ];
    };
  };
}
