return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-media-files.nvim",
  },
  opts = {
    extensions = {
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg" },
      },
    },
  },
  config = function(opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    local builtin = require("telescope.builtin")
    -- stylua: ignore start
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in cwd" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find files in git repository" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
    vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find recent commands" })
    vim.keymap.set("n", "<leader>fb", "<CMD>Telescope file_browser path=%:p:h<CR>", { desc = "Browse files" })
    -- stylua: ignore end
  end,
}
