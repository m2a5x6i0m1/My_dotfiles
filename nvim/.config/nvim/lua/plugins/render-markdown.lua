return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown" },
	config = function()
		require("render-markdown").setup({
			completions = { lsp = { enabled = true } },
			render_modes = true,
			callout = {
				quote = {
					raw = "[!QUOTE]",
					rendered = "󱆨 Quote",
					highlight = "RenderMarkdownQuote",
					category = "obsidian",
				},
				cite = {
					raw = "[!CITE]",
					rendered = "󱆨 Cite",
					highlight = "RenderMarkdownQuote",
					category = "obsidian",
				},
			},
			heading = {
				border = true,
				sign = false,
				width = "block",
				min_width = 70,
			},
			code = {
				sign = false,
				position = "right",
				border = "thick",
				width = "block",
				left_pad = 2,
				right_pad = 2,
				min_width = 70,
			},
			checkbox = {
				unchecked = { icon = " 󰄱 " },
				checked = { icon = " 󰱒 " },
			},
			bullet = { icons = { "◇", "◆", "○", "●" } },
			dash = { width = 70 },
		})
	end,
}
