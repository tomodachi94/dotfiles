let
  browser = "vivaldi-stable.desktop";
  text-editor = "nvim.desktop";
  image-viewer = "feh.desktop";
  file-explorer = "nnn.desktop";
in
{
  # Setup default browser (Vivaldi)
  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/javascript" = [ text-editor ];
      "application/x-extension-htm" = [ browser ];
      "application/x-extension-html" = [ browser ];
      "application/x-extension-shtml" = [ browser ];
      "application/x-extension-xht" = [ browser ];
      "application/x-extension-xhtml" = [ browser ];
      "application/xhtml+xml" = [ browser ];
      "application/x-httpd-php3" = [ text-editor ];
      "application/x-httpd-php4" = [ text-editor ];
      "application/x-httpd-php5" = [ text-editor ];
      "application/x-m4" = [ text-editor ];
      "application/xml" = [ text-editor ];
      "application/x-php" = [ text-editor ];
      "application/x-ruby" = [ text-editor ];
      "application/x-shellscript" = [ text-editor ];
      "image/bmp" = [ image-viewer ];
      "image/gif" = [ image-viewer ];
      "image/jpeg" = [ image-viewer ];
      "image/png" = [ image-viewer ];
      "image/tiff" = [ image-viewer ];
      "image/x-icon" = [ image-viewer ];
      "image/x-xbitmap" = [ image-viewer ];
      "image/x-xpixmap" = [ image-viewer ];
      "inode/directory" = [ file-explorer ];
      "text/css" = [ text-editor ];
      "text/html" = [ browser ];
      "text/plain" = [ text-editor ];
      "text/turtle" = [ text-editor ];
      "text/x-c++hdr" = [ text-editor ];
      "text/x-chdr" = [ text-editor ];
      "text/x-csharp" = [ text-editor ];
      "text/x-c++src" = [ text-editor ];
      "text/x-csrc" = [ text-editor ];
      "text/x-diff" = [ text-editor ];
      "text/x-dsrc" = [ text-editor ];
      "text/x-fortran" = [ text-editor ];
      "text/x-java" = [ text-editor ];
      "text/x-makefile" = [ text-editor ];
      "text/x-pascal" = [ text-editor ];
      "text/x-perl" = [ text-editor ];
      "text/x-python" = [ text-editor ];
      "text/x-sql" = [ text-editor ];
      "text/x-vb" = [ text-editor ];
      "text/yaml" = [ text-editor ];
      "x-scheme-handler/chrome" = [ browser ];
      "x-scheme-handler/http" = [ browser ];
      "x-scheme-handler/https" = [ browser ];
      # "x-scheme-handler/zotero" = [ "zotero.desktop" ];
    };
  };
}
