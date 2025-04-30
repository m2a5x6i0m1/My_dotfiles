return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = false,
			term_colors = true,
			integrations = {
				blink_cmp = true,
				noice = true,
				notify = true,
				which_key = true,
				snacks = {
					enabled = true,
					indent_scope_color = "text",
				},
			},

			custom_highlights = function(colors)
				return {
					["@markup.quote"] = { fg = colors.subtext1, style = {} },
					["RenderMarkdownQuote"] = { fg = colors.maroon },
					["RenderMarkdownInlineHighlight"] = { fg = colors.yellow, bg = colors.kurface2 },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
