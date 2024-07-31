{ pkgs, ... }:
{
  programs.librewolf.profiles.default.search = {
    force = true;
    default = "DuckDuckGo";
    engines = {
      "Nixpkgs" = {
        urls = [{
          template = "https://search.nixos.org/packages";
          params = [
            { name = "channel"; value = "unstable"; }
            { name = "query"; value = "{searchTerms}"; }
          ];
        }];
        icon = "''${pkgs.gnome-icon-theme}/share/icons/gnome/256x256/mimetypes/package.png";
        definedAliases = [ "!pkgs" ];
      };
      "NixOS options" = {
        urls = [{
          template = "https://search.nixos.org/options";
          params = [
            { name = "channel"; value = "unstable"; }
            { name = "query"; value = "{searchTerms}"; }
          ];
        }];
        icon = "''${pkgs.gnome-icon-theme}/share/icons/gnome/48x48/categories/gnome-settings.png";
        definedAliases = [ "!nixos" ];
      };
      "Home Manager options" = {
        urls = [{
          template = "https://home-manager-options.extranix.com";
          params = [
            { name = "release"; value = "master"; }
            { name = "query"; value = "{searchTerms}"; }
          ];
        }];
        icon = "''${pkgs.gnome-icon-theme}/share/icons/gnome/48x48/actions/stock_home.png";
        definedAliases = [ "!hm" ];
      };
      "NixOS Wiki" = {
        urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
        icon = "''${pkgs.gnome-icon-theme}/share/icons/gnome/48x48/mimetypes/contents2.png";
        definedAliases = [ "!nixoswiki" ];
      };
      "GitHub" = {
        urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
        icon = "''${pkgs.mint-y-icons}/share/icons/Mint-Y/scalable/apps/256@2x/web-github.png";
        definedAliases = [ "!github" "!gh" ];
      };
      "Bing".metaData.hidden = true;
      "Google".metaData.hidden = true;
      "DuckDuckGo Lite".metaData.hidden = true;
      "MetaGer".metaData.hidden = true;
      "4get.ca (captcha)".metaData.hidden = true;
      "SearXNG - searx.be".metaData.hidden = true;
      "StartPage".metaData.hidden = true;
    };
  };
}
