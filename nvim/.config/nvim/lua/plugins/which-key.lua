return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		preset = "helix",
		delay = 0,
		spec = {
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>s", group = "[S]plit" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>h", group = "[H]unk" },
			{ "<leader>l", group = "[L]azy" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>r", group = "[R]e" },
			{ "<leader>n", group = "[N]ote" },
			{ "<leader>d", group = "[D]iagnostic" },
		},
		icons = {
			separator = ">  ", -- Symbol used between a key and it's label
			group = "", -- symbol prepended to a group
			mappings = false,
		},
	},
}
