return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cofig = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "c",
          "cpp",
          "glsl",
          "cmake",
          "make",
          "bash",
          "lua",
          "python",
          "vim",
          "vimdoc",
          "diff",
          "git_commit",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitignore",
          "html",
          "css",
          "javascript",
          "latex",
          "markdown",
          "xml",
          "yaml",
          "csv",
          "disassembly",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
