local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" } }, {
	-- Check for updates automatically.
	checker = {
		enabled = true,
		notify = false,
	},
	install = {
		missing = true,
	},
	change_detection = {
		notify = false,
	},
})
