-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
vim.opt.titlestring = '%t: %{expand("%:~:.:h")}'

vim.opt.colorcolumn = "80,100"

-- disable some extension providers
-- vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
-- vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.python3_host_prog = "~/.pyenv/versions/neovim/bin/python"

vim.opt.timeoutlen = 400
vim.opt.ttimeoutlen = 0

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
  -- vim.g.neovide_scale_factor = 1.2
  -- vim.opt.linespace = 2
end
