return {
  "nvim-telescope/telescope.nvim",

  -- tag = '0.1.8',
  -- If you have found the undo state you were looking for, you can use <C-cr>
  -- or <C-r> to revert to that state. If you'd rather not change your whole
  -- buffer, you can use <cr> to yank the additions of this undo state into
  -- your default register (use <S-cr> or <C-y> to yank the deletions).

  dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" },

  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Find git files' })
    vim.keymap.set('n', '<leader>of', builtin.git_files, { desc = 'Old files' })
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

    require('telescope').setup({
      extensions = {
        undo = {

        }
      }
    })

    require('telescope').load_extension('undo')
  end
}
