return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("noice").setup({

			messages = { enabled = true },
			popupmenu = { enabled = false },
			notify = { enabled = false },

			lsp = {
				progress = { enabled = true },
				message = { enabled = true },
				hover = { enabled = false },
				signature = { enabled = false },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},

			views = {
				cmdline_popup = {
					position = { row = "71%" },
					size = { min_width = 61 },
				},
			},
		})
	end,
}
