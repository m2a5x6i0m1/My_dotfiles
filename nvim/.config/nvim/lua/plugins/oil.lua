return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("oil").setup({
			win_options = { signcolumn = "yes" },
			view_options = { show_hidden = true },
			default_file_explorer = true,
			watch_for_changes = true,
			columns = {
				"icon",
			},
			keymaps = {
				["<Esc><Esc>"] = "actions.close",
				["gd"] = function()
					require("oil").set_columns({ "icon", "type", "permissions" })
				end,
				["gl"] = function()
					require("oil").set_columns({ "icon" })
				end,
			},
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
