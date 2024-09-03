-- Disable netrw as the very first step to prevent race conditions.
-- From nvim-tree.lua.
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

require("config.remap")
require("config.options")
require("config.lazy")

vim.cmd("colorscheme tokyonight")
