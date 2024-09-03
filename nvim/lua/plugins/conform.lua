return {
  "stevearc/conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      lua = { "stylua", "trim_whitespace" },
      html = { "htmlbeautifier" },
      ["_"] = { "trim_whitespace" },
    },
    notify_on_error = true,
    notify_no_formatters = true,
    format_on_save = {
      timeout_ms = 500,
    },
  },
}
