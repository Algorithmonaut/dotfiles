-- CONF: Main
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.clipboard = "unnamedplus" -- use system clipboard
vim.o.undofile = true           -- save undo history

-- CONF: Visual
vim.opt.colorcolumn = "80"
vim.o.termguicolors = true
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.relativenumber = true -- enable relative line numbering
vim.o.number = true         -- needed for current line number

vim.o.updatetime = 250      -- decrease update time, default to 4000
vim.o.guicursor = "a:block" -- always use block cursor
vim.wo.signcolumn = "yes"   -- or 'auto', column on the left of line numbers

vim.o.scrolloff = 10

vim.g.neovide_floating_shadow = false
vim.g.neovide_padding_top = 15
vim.g.neovide_padding_bottom = 15
vim.g.neovide_padding_right = 15
vim.g.neovide_padding_left = 15

-- vim.o.guifont = "Source Code Pro SemiBold:h15"
vim.o.guifont = "Source Code Pro:h15"


-- Needed by obsidian plugin
vim.opt.conceallevel = 1

-- CONF: Interface
vim.o.mouse = "a" -- enable mouse support

-- CONF: Tabulation
vim.o.tabstop = 2        -- tabulation width
vim.o.shiftwidth = 2     -- tabulation width when >> or <<
vim.opt.expandtab = true -- convert tabs to spaces

-- CONF: Search
vim.o.hlsearch = true -- highlight on search, interfere with noice.nvim?
vim.o.ignorecase = true
vim.o.smartcase = true

-- CONF: Folding
vim.o.foldmethod = 'syntax' -- syntax based folding use TS to determine what to fold
vim.o.foldlevel = 99        -- keep all folds open by default

-- CONF: Keybinds
vim.keymap.set("n", "<leader><leader>", "<cmd>nohlsearch<CR>", { desc = "[ ] Clear highlights", noremap = true })
vim.keymap.set("n", "<Esc>", "<cmd>write<cr>", { noremap = true })
vim.keymap.set("v", "gp", '"_d"+P', { noremap = true }) -- paste without writing to clipboard

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { noremap = true })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { noremap = true })


vim.cmd([[
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Wq wq
  cnoreabbrev Wqa wqa

  cnoreabbrev nw Neorg workspace
  cnoreabbrev nr Neorg return

  cnoreabbrev wa w !sudo dd of=%
]])

-- Disabled
vim.keymap.set("n", "yy", "", { noremap = true })
vim.keymap.set("n", "dd", "", { noremap = true })

-- CONF: Hightlight on yank
vim.api.nvim_create_augroup('highlight_yank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),

  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

-- CONF: Plugins
require("config.lazy")

-- CONF: Toogle diagnostics

local diagnostics_visible = true

function ToggleDiagnostics()
  if diagnostics_visible then
    vim.diagnostic.enable(false)
    print("Diagnostics disabled")
  else
    vim.diagnostic.enable()
    print("Diagnostics enabled")
  end
  diagnostics_visible = not diagnostics_visible
end

vim.api.nvim_set_keymap('n', '<leader>td', ':lua ToggleDiagnostics()<CR>', { noremap = true, silent = true })

-- Make .h files C files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.h",
  command = "set filetype=c"
})

-- CONF: Hard wrap on norg files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function()
    vim.opt_local.textwidth = 80 -- Set text width to 80
    vim.opt_local.wrap = true    -- Enable line wrapping
  end,
})
