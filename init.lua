---@diagnostic disable: undefined-global
-- PLUGINS
require("config.lazy")
require 'config.marks-setup'
require 'config.gitsigns-setup'
require 'git-conflict'.setup {
	default_mappings = {
		ours = 'o',
		theirs = 't',
		none = '0',
		both = 'b',
		next = 'n',
		prev = 'p',
	},
}

-- MINI STUFF
require('mini.hues').setup({
	background = '#101010',
	foreground = '#ffffff',
	saturation = 'medium',
	n_hues = 8,
	accent = 'purple',
	plugins = { default = true },
})
require('mini.ai').setup()
require('mini.surround').setup()
require('mini.operators').setup()
require('mini.pairs').setup()
require('mini.icons').setup()
require('mini.completion').setup()
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
	snippets = {
		-- Load custom file with global snippets first (adjust for Windows)
		gen_loader.from_file('C:\\Users\\mwooldridge\\AppData\\Local\\nvim\\snippets\\global.json'),

		-- Load snippets based on current language by reading files from
		-- "snippets/" subdirectories from 'runtimepath' directories.
		gen_loader.from_lang(),
	},
})
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.bracketed').setup()
require('mini.files').setup()



-- NVIM SETTINGS
vim.diagnostic.config({ virtual_text = true })

-- THEME STUFF
vim.cmd.colorscheme('miniwinter');
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
--	LEADER + e = File Explorer (mini-files)
vim.api.nvim_set_keymap('n', '<leader>e', ':lua MiniFiles.open()<CR>', { silent = true, noremap = true })
--	LEADER + . = Code Actions (LSP)
vim.api.nvim_set_keymap('n', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true });
--	LEADER + gg = lazygit
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
