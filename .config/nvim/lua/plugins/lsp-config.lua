-- :h vim.lsp.buf: list of options to use for LSPs

return {
  {
    -- Easily install languages LSPs
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end
  },

  {
    -- Bridges Mason and LSPconfig, e.g. ensure installed
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright", "zls" }
      })
    end

  },

  {
    -- Allows nvim to communicate with LSPs
    "neovim/nvim-lspconfig",
    -- dependencies = { "saghen/blink.cmp" },

    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            workspace = {
              library = { "~/programming/" }
            }
          }
        }
      })

      lspconfig.clangd.setup({
      })

      lspconfig.zls.setup({
      })

      lspconfig.pyright.setup({
        filetypes = { "python" },

        settings = {
          python = {
            formatting = {
              indentSize = 2, -- Number of spaces for indentation
              tabSize = 2,    -- Number of spaces per tab
            },
          },
        },
      })

      local opts = { noremap = true, silent = true }

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      -- Setup code actions, check video for telescope integration
    end

  }
}
