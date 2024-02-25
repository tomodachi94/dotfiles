{ mac-app-util, ... }:
{
  imports = [
    mac-app-util.homeManagerModules.default
    ./desktop-standalone-packages
  ];
}
