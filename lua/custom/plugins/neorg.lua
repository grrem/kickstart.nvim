return {
  'nvim-neorg/neorg',
  lazy = false,
  version = '*',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              as_tools = 'C:/Users/rdec/OneDrive - Demant/Notes/AS_tools/',
              line_mgmt = 'C:/Users/rdec/OneDrive - Demant/Notes/Line_management/',
            },
            default_workspace = 'as_tools',
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
