-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec

-- My own options
--
vim.o.colorcolumn = '72,80'

-- Extra plugins
require('telescope').setup {
  defaults = {
    path_display = { 'truncate' },
  },
}

-- Term Toggle Function
local term_buf = nil
local term_win = nil

function TermToggle(height)
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.cmd("hide")
    else
        vim.cmd("botright new")
        local new_buf = vim.api.nvim_get_current_buf()
        vim.cmd("resize " .. height)
        if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
            vim.cmd("buffer " .. term_buf) -- go to terminal buffer
            vim.cmd("bd " .. new_buf) -- cleanup new buffer
        else
            vim.cmd("terminal")
            term_buf = vim.api.nvim_get_current_buf()
            vim.wo.number = false
            vim.wo.relativenumber = false
            vim.wo.signcolumn = "no"
        end
    vim.cmd("startinsert!")
    term_win = vim.api.nvim_get_current_win()
    end
end

-- Term Toggle Keymaps
vim.keymap.set("n", "<leader>tt", ":lua TermToggle(20)<CR>", { noremap = true, silent = true , desc = "Toggle Terminal" })
-- vim.keymap.set("i", "<A-t>", "<Esc>:lua TermToggle(20)<CR>", { noremap = true, silent = true })
-- vim.keymap.set("t", "<A-t>", "<C-\\><C-n>:lua TermToggle(20)<CR>", { noremap = true, silent = true })

-- Quickfix mappings
vim.keymap.set("n", "<leader>co", ":copen<CR>", { noremap = true, silent = true , desc = "Open Quickfix" })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { noremap = true, silent = true , desc = "Next Quickfix" })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { noremap = true, silent = true , desc = "Previous Quickfix" })

-- Custom LSP tryout
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "text",
--     callback = function()
--         vim.lsp.start({
--             name = "example-server",
--             cmd = { "python", "C:/Users/rdec/ws/lsp_experiment/try_pygls.py" },
--             root_dir = vim.fn.getcwd(),
--         })
--     end,
-- })

-- -- Alternative LSP setup using lspconfig
-- local lspconfig = require('lspconfig')
-- local configs = require('lspconfig.configs')
--
-- -- Register the custom server
-- if not configs.example_server then
--     configs.example_server = {
--         default_config = {
--             cmd = { "python", "C:/Users/rdec/ws/lsp_experiment/try_pygls.py" },
--             filetypes = { "text" },
--             root_dir = lspconfig.util.root_pattern(".git") or vim.fn.getcwd,
--             settings = {},
--         },
--     }
-- end
--
-- lspconfig.example_server.setup({})

-- Copilot
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

