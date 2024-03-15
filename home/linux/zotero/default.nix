let
  better-bibtex = fetchurl {
    url = "https://github.com/retorquere/zotero-better-bibtex/releases/download/v6.7.165/zotero-better-bibtex-6.7.165.xpi";
    hash = "sha256-1c83prdykx6lal4vpfqpag9qk1m6kjlrw6sqa9pa7j6bdpzxw148=";
  };
in
{
  home.file.".zotero/zotero/profiles.ini".source = "${./profiles.ini}";
  home.file.".zotero/zotero/jjf1jhf5.default/
}
