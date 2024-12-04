{ lib, config, ... }:
lib.mkIf config.local.system.darwin {
  programs.git = {
    ignores = [
      ".DS_Store" # https://en.wikipedia.org/wiki/.DS_Store
    ];
  };
}
