# Neovim Configuration

My Neovim configuration.

## File structure

### justfile

Contains some automation for setting up a new environment.

### `lua/`

Contains Lua scripts.

#### `plugins.lua`

Contains plugins. I use [Paq](https://github.com/savq/paq-nvim), because it's fast and Lua.

Also contains theme settings.

#### `conf-mediawiki-editor.lua`

Contains config for MediaWiki. I use [Alex Quach's `vim-mediawiki-editor`](https://github.com/aquach/vim-mediawiki-editor), with some minor tweaks as they haven't been merged into the plugin yet.

#### `conf-ultisnips.lua`

Configuration for [UltiSnips](https://github.com/SirVer/ultisnips).

#### `*-creds.lua`

Contains credentials for things that require authentication (eg. `vim-mediawiki-editor`).

### `snips/`

Contains snippets for use with UltiSnips.

### `vimscript/`

Contains legacy Vimscript code. This will usually be empty.
