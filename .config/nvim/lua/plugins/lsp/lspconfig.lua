return {
	"neovim/nvim-lspconfig",
	event = {"BufReadPre", "BufNewFile"},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{"antosha417/nvim-lsp-file-operations", config = true}, -- allows change of nam
	},
	config = function()
		-- import lsp config
		local lspconfig = require("lspconfig")
		-- import cmp-nvim-lsp plug
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true}
		local on_attach = function(client,bufnr)
			opts.buffer = bufnr
			-- set bindkey
			keymap.set("n", "gR","<cmd>Telescope lsp_references<CR>", {})
			keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			keymap.set("n", "gd","<cmd>Telescope lsp_definitions<CR>", {})
			keymap.set("n", "gi","<cmd>Telescope lsp_implementations<CR>", {})
			keymap.set("n", "gt","<cmd>Telescope lsp_type_definitions<CR>", {})
			keymap.set("n","<leader>ca", vim.lsp.buf.code_action, {})
			-- extensions keymaps
			-- smart rename
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename,{})
			-- show buffer diagnostic
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", {})
			-- show line diagnostic
			keymap.set("n","<leader>d",vim.diagnostic.open_float,{})
			-- previous dianositc
			keymap.set("n","[d",vim.diagnostic.goto_prev,{})
			-- go to next diagnostic
			keymap.set("n","]d",vim.diagnostic.goto_next,{})
			-- show documentation for what is under cursor
			keymap.set("n", "K", vim.lsp.buf.hover,{})
			-- restart lsp	
			keymap.set("n", "<leader>rs", ":LspRestart<CR>",{})
		end
		-- enable auto completion
		local capabilities = cmp_nvim_lsp.default_capabilities()
		--LSP configs go from here below
		-- Most important LUA:
		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		-- LSP config lua		
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	-- lsp config for TS/JS	
		lspconfig["ts_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		})


	end,
}
