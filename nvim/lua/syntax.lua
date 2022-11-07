-- syntax-related Neovim configuration

-- enables per-filetype indentation settings
if vim.fn.has("autocmd") == 1 then
  vim.cmd("filetype indent plugin on")
end
