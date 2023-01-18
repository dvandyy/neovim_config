local builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.8, max = 70, min = 123 }
    },
  },
})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fe', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
