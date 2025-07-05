return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				cpp = { "clang-format" },
				python = { "isort", "black" },
				lua = { "stylua" },
				nix = { "alejandra" },
				markdown = { "prettierd" },
				json = { "prettierd" },
				css = { "prettierd" },
			},

			format_after_save = {
				lsp_fallback = true,
				async = true,
			},
		})
	end,
}
