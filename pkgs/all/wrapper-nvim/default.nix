{ inputs
, pkgs
, neovim-unwrapped
, vimPlugins
, nil
, lua-language-server
, jdt-language-server
, beancount-language-server
, vscode-json-languageserver
, yaml-language-server
, bash-language-server
, sqls
, deadnix
, statix
,
}:
inputs.mnw.lib.wrap pkgs {
  neovim = neovim-unwrapped;

  # all files in the `lua/lazy` folder are now autoloaded, so no need
  # for an init.lua in there
  initLua = ''
    require('myconfig')
    require('lz.n').load('lazy')
  '';
  plugins = {
    start = [
      vimPlugins.lz-n
      vimPlugins.plenary-nvim
      vimPlugins.catppuccin-nvim
      vimPlugins.nvim-lspconfig
      vimPlugins.none-ls-nvim
      vimPlugins.blink-cmp
    ];

    # Anything that you're loading lazily should be put here
    opt = [
      vimPlugins.telescope-nvim
    ];

    dev.myconfig = {

      # you can use lib.fileset to reduce rebuilds here
      # https://noogle.dev/f/lib/fileset/toSource
      pure = ./.;
      impure =
        # This is a hack it should be a absolute path
        # here it'll only work from this directory
        "/' .. vim.uv.cwd()  .. '/nvim";
    };
  };
  extraBinPath = [
    nil
    lua-language-server
    jdt-language-server
    beancount-language-server
    vscode-json-languageserver
    yaml-language-server
    bash-language-server
    sqls
    deadnix
    statix
  ];
}
