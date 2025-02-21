return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    vim.filetype.add({
      pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    })

    configs.setup({
      ensure_installed = { "c", "lua", "vimdoc", "hyprlang" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
