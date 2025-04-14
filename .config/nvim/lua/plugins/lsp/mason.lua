return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- Import mason and mason-lspconfig
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		-- Enable mason
		mason.setup()

		-- Configure mason-lspconfig
		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"lua_ls",
				"pyright",
				"clangd",
				"tailwindcss",
				"prismals", -- double-check this name
				"svelte",
				"emmet_ls",
				"rust_analyzer",
				"ts_ls",
				--"gopls",
			},
			automatic_installation = true,
		})
	end,
}
