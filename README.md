# Neovim Configuration

My Neovim configuration.

## Directories
### `lua`

Contains Lua scripts.

#### `vim-plugins.lua`

Contains plugins. I use [Paq](https://github.com/savq/paq-nvim), because it's fast and Lua.

Also contains theme settings.

#### `vim-mediawiki-editor.lua`

Contains config for MediaWiki. I use [Alex Quach's `vim-mediawiki-editor`](https://github.com/aquach/vim-mediawiki-editor), with some minor tweaks as they haven't been merged into the plugin yet.

#### `vim-ultisnips.lua`

Configuration for [UltiSnips](https://github.com/SirVer/ultisnips).

#### `*-creds.lua`

Contains credentials for things that require authentication (eg. `vim-mediawiki-editor`).

### `snips`

Contains snippets for use with UltiSnips.

### `vimscript`

Contains legacy Vimscript code. This will usually be empty.

