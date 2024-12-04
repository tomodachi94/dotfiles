{ config, lib, pkgs, ... }:
{
  options = {
    colorPickers.enable = lib.mkEnableOption "install color pickers to ~/Library/ColorPickers";
    colorPickers.colorPickers = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "List of packages whose color pickers should be linked";
    };
  };

  config = {
    assertions = [{
      assertion = config.home.colorPickers.enable && (config.home.colorPickers != [ ]) && !pkgs.stdenv.hostPlatform.isDarwin;
      message = "Must use Darwin to install color pickers.";
    }];

    home.activation.linkColorPickers = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      rm -rf ${config.home.homeDirectory}/Library/ColorPickers/*
      mkdir -p ${config.home.homeDirectory}/Library/ColorPickers
      ${lib.concatMapStrings (pkg: ''
        cp -r ${pkg}/Library/ColorPickers/* ${config.home.homeDirectory}/Library/ColorPickers/
      '') config.home.colorPickers}
    '';
  };
}
