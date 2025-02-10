return {
  {
    "mawkler/modicator.nvim",

    config = function()
      require("modicator").setup({})
    end,
  },

  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()

      vim.keymap.set("n", "<leader>rn", ":IncRename ")
    end,
  },

  -- {
  --   'mvllow/modes.nvim',
  --   -- tag = 'v0.2.1',
  --
  --   config = function()
  --     require('modes').setup({
  --       colors = {
  --         bg = "#000000", -- Optional bg param, defaults to Normal hl group
  --         -- copy = "#f5c359",
  --         -- delete = "#c75c6a",
  --         insert = "#",
  --         visual = "#504945",
  --         -- Default background color: bg2
  --
  --       },
  --
  --       line_opacity = 1,
  --
  --     })
  --   end
  -- }

  -- "svampkorg/moody.nvim",

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },

    config = function()
      require("todo-comments").setup({})
    end
  }

  -- {
  -- 	"numToStr/Comment.nvim",
  -- 	lazy = false,
  --
  -- 	opts = {
  -- 		---Add a space b/w comment and the line
  -- 		padding = true,
  -- 		---Whether the cursor should stay at its position
  -- 		sticky = true,
  -- 		---Lines to be ignored while (un)comment
  -- 		ignore = nil,
  -- 		---LHS of toggle mappings in NORMAL mode
  -- 		toggler = {
  -- 			---Line-comment toggle keymap
  -- 			line = "gcc",
  -- 			---Block-comment toggle keymap
  -- 			block = "gbc",
  -- 		},
  -- 		---LHS of operator-pending mappings in NORMAL and VISUAL mode
  -- 		opleader = {
  -- 			---Line-comment keymap
  -- 			line = "gc",
  -- 			---Block-comment keymap
  -- 			block = "gb",
  -- 		},
  -- 		---LHS of extra mappings
  -- 		extra = {
  -- 			---Add comment on the line above
  -- 			above = "gcO",
  -- 			---Add comment on the line below
  -- 			below = "gco",
  -- 			---Add comment at the end of line
  -- 			eol = "gcA",
  -- 		},
  -- 		---Enable keybindings
  -- 		---NOTE: If given `false` then the plugin won't create any mappings
  -- 		mappings = {
  -- 			---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
  -- 			basic = true,
  -- 			---Extra mapping; `gco`, `gcO`, `gcA`
  -- 			extra = true,
  -- 		},
  -- 	},
  -- },
}
