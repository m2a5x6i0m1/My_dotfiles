return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } })

		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			textobjects = { enable = false },

			auto_install = true,
			ensure_installed = {
				"json",
				"css",
				"markdown",
				"markdown_inline",
				"html",
				"regex",
				"vim",
				"vimdoc",
				"c",
				"cpp",
				"hyprlang",
				"python",
				"bash",
				"lua",
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<A-space>",
					node_incremental = "<A-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		require("treesitter-context").setup()
	end,
}
