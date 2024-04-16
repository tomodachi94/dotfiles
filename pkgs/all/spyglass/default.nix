{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, atk
, bzip2
, cairo
, dbus
, gdk-pixbuf
, glib
, gtk3
, openssl
, pango
, sqlite
, webkitgtk
, zstd
, stdenv
, darwin
}:

rustPlatform.buildRustPackage rec {
  pname = "spyglass";
  version = "2023.5.1";

  src = fetchFromGitHub {
    owner = "spyglass-search";
    repo = "spyglass";
    rev = "v${version}";
    hash = "sha256-+NEuWhEQEtATn2bIcTtBgBrJ1JjJtkTzZUlaZ7dxhw0=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "auth_core-0.1.0" = "sha256-6f/mAAt4zhMgEASrZZO8cAvNLG4DvwIte9eBI1VOa+8=";
      "docx-1.1.2" = "sha256-H5KjtrbWlr2+js9JX6EsEX0/leIGBRXSVeToON77GL4=";
      "fix-path-env-0.0.0" = "sha256-+CI11TM+dGQZL40790N6WQJrm41z/3kDej2RwfzOZDs=";
      "hard-xml-0.0.0" = "sha256-hCGa8pswxo8KdFDv5kzqPmgGM6yYyUngMJ6K3uVNUpA=";
      "tauri-plugin-deep-link-0.1.0" = "sha256-ShfTOK3QR1oLHMqpDfILjWXS7A0z8TB4knS3VirlOUA=";
      "whisper-rs-0.6.0" = "sha256-VRL+Khs8nCknDPPhC4tSCdQ8wWnzH8D9yR9FS6HOiRQ=";
    };
  };

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    atk
    bzip2
    cairo
    dbus
    gdk-pixbuf
    glib
    gtk3
    openssl
    pango
    sqlite
    webkitgtk
    zstd
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.AppKit
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.CoreGraphics
    darwin.apple_sdk.frameworks.CoreServices
    darwin.apple_sdk.frameworks.Foundation
    darwin.apple_sdk.frameworks.Security
    darwin.apple_sdk.frameworks.SystemConfiguration
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  meta = with lib; {
    description = "A personal search engine:  Create a searchable library from your personal documents, interests, and more";
    homepage = "https://github.com/spyglass-search/spyglass";
    license = licenses.agpl3Only;
    maintainers = with maintainers; [ ];
  };
}
