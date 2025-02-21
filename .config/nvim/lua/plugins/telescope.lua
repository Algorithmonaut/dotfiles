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
    vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Find files in git project' })
    vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>')
    vim.keymap.set('n', '<leader>fi', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy search inside buffer' })
    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'List symbols in current buffer and GD' })
    vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'List all marks and open on CR' })
    vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'List jumplist and open on CR' })

    require('telescope').setup({
      extensions = {
        undo = {

        }
      }
    })

    require('telescope').load_extension('undo')
  end
}
