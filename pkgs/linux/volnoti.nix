{ volnoti, fetchFromGitHub }:
volnoti.overrideAttrs (finalAttrs: previousAttrs: {
  src = fetchFromGitHub {
    owner = "eterniter06";
    repo = "volnoti";
    rev = "b7c5761ebff1af74ce31e7527da485117e58c7b3";
    hash = "sha256-VUkyLcMmzPtqHd04i6r472IbyxCwTpBnWixHWJ4KZB4=";
  };
  patches = [ ];
})
