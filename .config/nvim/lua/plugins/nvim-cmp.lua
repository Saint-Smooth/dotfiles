return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
	"hrsh7th/cmp-buffer", -- source in buffer text
	"hrsh7th/cmp-path", -- source for file paths
	"L3MON4D3/LuaSnip", -- for snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", --useful snippets
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		-- load all vscode like:
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
		completion = {
			completeopt = "menu,menuone,preview,noselect",
		},
		snippet = { --configure nvim/snippet engine interaction
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		
		},
		mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- pref sugg	
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll down five
		["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll up five
		["<C-space>"] = cmp.mapping.complete(), -- show complition selection
		["<C-e>"] = cmp.mapping.abort(), --abort
		["<CR>"] = cmp.mapping.confirm({select = false}), -- confirm	
		}),
		sources = cmp.config.sources({
			{name = "luasnip"}, --snippets
			{name = "nvim_lsp"},--lsp baby
			{name = "buffer"}, -- text with current buffer
			{name = "path"}, -- file system paths
		}),
	})
	
end,	
}
