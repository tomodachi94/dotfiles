self: super:
# This override specifies the specifc Nerd Font I use (IBM Plex).
{
  nerdfonts = super.nerdfonts.override {
    fonts = [ "IBMPlexMono" ];
  };
}
