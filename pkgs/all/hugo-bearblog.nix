{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  pname = "hugo-bearblog";
  version = "2024-01-23";
  src = fetchFromGitHub {
    owner = "janraasch";
    repo = "hugo-bearblog";
    rev = "0b64d5ad103c716da5a79b48855f1489f6738ba7";
    hash = "sha256-cyMWdCIZJV6zyIEgg3jbPV1BfDO4eRUY8pP6PmDfY6Y=";
  };
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir $out
    cp $src/theme.toml $out
    cp -r $src/layouts $out
    cp -r $src/archetypes $out
  '';
}
