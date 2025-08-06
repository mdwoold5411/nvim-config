-- PLUGINS
require("config.lazy")
require('hardline').setup {}

vim.diagnostic.config({ virtual_text = true })

-- THEME STUFF
vim.cmd [[colorscheme evergarden]]
vim.opt.number = true

-- KEYMAPS
--	LEADER + p = telescope find file names
vim.api.nvim_set_keymap('n', '<leader>p', ':lua require"telescope.builtin".find_files{}<CR>',
	{ noremap = true, silent = true })
--	LEADER + SHIFT + p = telescope grep search directory recursively
vim.api.nvim_set_keymap('n', '<leader>P', ':lua require"telescope.builtin".live_grep{}<CR>',
	{ noremap = true, silent = true })
--	LEADER + r = rename symbol neovim
vim.api.nvim_set_keymap('n', '<leader>r', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
--	LEADER + f = format buffer
vim.api.nvim_set_keymap('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true });
--	LEADER + e = File Explorer (CHADtree)
vim.api.nvim_set_keymap('n', '<leader>e', ':CHADopen<CR>', {silent = true, noremap = true })

