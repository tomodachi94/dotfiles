{ src, stdenv, craftos-pc, SDL2, SDL2_mixer }:
stdenv.mkDerivation {
  inherit src;
  name = "craftos-pc-plugin-sound";
  buildInputs = [ craftos-pc SDL2 SDL2_mixer ];
  buildPhase = ''
    g++ -fPIC -shared -I${craftos-pc}/include/ -o sound.so sound.cpp craftos2/craftos2-lua/src/liblua.a -lSDL2 -lSDL2_mixer
  '';
  installPhase = ''
    mkdir -p $out/share/craftos/plugins
    cp sound.so $out/share/craftos/plugins
  '';
}
