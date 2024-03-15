{ pkgs, ... }:
{
xdg.configFile."zsh/vendor-completions".source = with pkgs;
  runCommandNoCC "vendored-zsh-completions" {} ''
    mkdir -p $out
    ${fd}/bin/fd -t f '^_[^.]+$' \
      ${lib.escapeShellArgs home.packages} \
      --exec ${ripgrep}/bin/rg -0l '^#compdef' {} \
      | xargs -0 cp -t $out/
   '';
}
