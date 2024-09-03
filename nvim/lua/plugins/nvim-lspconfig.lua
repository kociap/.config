return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("user_lsp_config", { clear = true }),
      callback = function(e)
        local telescope = require("telescope.builtin")

        vim.keymap.set(
          "n",
          "gd",
          vim.lsp.buf.definition,
          { buffer = e.buf, desc = "Go to definition" }
        )
        vim.keymap.set(
          "n",
          "gD",
          vim.lsp.buf.declaration,
          { buffer = e.buf, desc = "Go to declaration" }
        )
        vim.keymap.set(
          "n",
          "gr",
          telescope.lsp_references,
          { buffer = e.buf, desc = "Show references" }
        )
        -- Alternative keymap. Shows references in a split window.
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = e.buf, desc = "Go to references" })
        vim.keymap.set(
          "n",
          "gi",
          vim.lsp.buf.implementation,
          { buffer = e.buf, desc = "Go to implementation" }
        )
        vim.keymap.set(
          "n",
          "gs",
          vim.lsp.buf.signature_help,
          { buffer = e.buf, desc = "Show signature help" }
        )
        vim.keymap.set(
          "n",
          "gt",
          vim.lsp.buf.type_definition,
          { buffer = e.buf, desc = "Go to type definition" }
        )
        vim.keymap.set(
          "n",
          "<leader>rn",
          vim.lsp.buf.rename,
          { buffer = e.buf, desc = "Rename under cursor" }
        )
      end,
    })

    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force",
      capabilities,
      cmp_nvim_lsp.default_capabilities()
    )
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({ capabilities = capabilities })
      end,
    })
  end,
}
