return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },

  config = function()
    local function show_macro_recording()
      local register = vim.fn.reg_recording()
      if register ~= "" then
        return "@" .. register
      end
    end

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "gruvbox-material",
        section_separators = "",
        component_separators = "",
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 10,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {
          { "mode" },
          {
            "macro-recording",
            fmt = show_macro_recording,
          },
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
