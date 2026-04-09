return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
    -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
    default_file_explorer = true,

    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = true,

    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },

    -- Configuration for the floating window in oil.open_float
    float = {
      -- Padding around the floating window
      padding = 6,
      border = 'rounded',
    },

    keymaps = {
      ['<BS>'] = 'actions.parent',
      ['<CR>'] = 'actions.select',
      ['<C-s>'] = 'actions.select_vsplit',
      ['<ESC>'] = { 'actions.close', mode = 'n' },

      ['<C-h>'] = 'actions.select_split',
      ['<C-t>'] = 'actions.select_tab',
      ['<C-p>'] = 'actions.preview',
    },
  },

  -- Optional dependencies
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons

  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,

  config = function(_, opts) require('oil').setup(opts) end,

  vim.keymap.set('n', '-', "<CMD>lua require('oil').open_float('.')<CR>", { desc = 'Open current working directory in Oil' }),
  vim.keymap.set('n', '_', "<CMD>lua require('oil').open_float()<CR>", { desc = 'Open parent directory in Oil' }),
}
