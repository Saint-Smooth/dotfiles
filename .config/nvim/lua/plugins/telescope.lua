return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim'
		},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				vimgrep_arguments = {
					'rg',
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case',
					'--hidden',
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				pickers = {
					find_files = {
					hidden = true
					}
				},
			},
		})
		-- load extension
		telescope.load_extension("fzf");
		-- Set the keymaps
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', function()
			require("telescope.builtin").find_files({ hidden = false})
		end, {})
		vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', '<leader>gs', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}

