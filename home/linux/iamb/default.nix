{
  imports = [ ./module.nix ];

  programs.iamb = {
    enable = true;
    settings = {
      profiles."matrix.org" = {
        user_id = "@tomodachi94:matrix.org";
        url = "https://matrix.org";
      };
    };
  };
}
