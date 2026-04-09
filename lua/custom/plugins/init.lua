-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

require('telescope').setup {
  defaults = {
    path_display = { 'smart' },
  },
}

return {
  'github/copilot.vim',

  -- vim.g.copilot_no_tab_map = true,

  vim.keymap.set('i', '<C-O>', '<Plug>(copilot-accept-word)'),
  vim.keymap.set('i', '<C-I>', '<Plug>(copilot-accept-line)'),
  vim.keymap.set('i', '<C-N>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
  }),
}
