return {
  -- {
  --   "f4z3r/gruvbox-material.nvim",
  --   name = "gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --
  --   config = function()
  --     require("gruvbox-material").setup({
  --       italics = true, -- enable italics in general
  --       contrast = "medium",
  --       comments = {
  --         italics = true, -- enable italic comments
  --       },
  --       background = {
  --         transparent = false, -- use terminal background
  --       },
  --       float = {
  --         force_background = false, -- force background on floats even when background.transparent is set
  --         background_color = nil,   -- set color for float backgrounds. If nil, uses the default color set by the color scheme
  --       },
  --     })
  --   end,
  -- }

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end
  }

}
