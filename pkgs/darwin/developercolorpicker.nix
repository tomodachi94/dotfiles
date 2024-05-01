{ stdenv, lib, fetchzip }:
stdenv.mkDerivation {
  pname = "developercolorpicker";
  version = "1.5.4"; # Mentioned in Read Me.rtfd
  src = fetchzip {
    url = "https://download-cdn.panic.com/picker/developercolorpicker.zip";
    hash = "sha256-oqejHyx5yhOmSHBCIQSwTtAlzs1siez0MYItl1OxU6w=";
    stripRoot = false;
  };
  installPhase = ''
    mkdir -p $out/Library/ColorPickers
    cp -r "$src/Developer Color Picker/DeveloperColorPicker.colorPicker" $out/Library/ColorPickers
  '';
  meta = with lib; {
    description = "";
    homepage = "https://panic.com/blog/developer-color-picker-1-5/";
    license = licenses.unfree;
    platforms = [ "x86_64-darwin" "aarch64-darwin" ];
    maintainers = with maintainers; [ tomodachi94 ];
  };
}
