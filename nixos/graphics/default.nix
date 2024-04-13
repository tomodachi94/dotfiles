{
  hardware.opengl = {
    enable = true;

    # > On 64-bit systems, whether to support Direct Rendering for 32-bit applications (such as Wine).
    # > -- Manual
    # I enabled this to allow running the Epic Games Store through Lutris and Wine.
    # See https://nixos.wiki/wiki/Lutris for more information.
    driSupport32Bit = true; # Did you read the comment before turning this off?
  };
}
