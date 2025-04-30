return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lazy_status = require("lazy.status") -- To configure lazy pending updates count

		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true,
			},

			sections = {
				lualine_a = {
					{ "mode", separator = "" },
					{
						function()
							local reg = vim.fn.reg_recording()
							if reg == "" then
								return ""
							end
							return "->  @" .. reg .. " "
						end,
					},
				},
				lualine_c = {},
				lualine_x = {
					{
						function()
							-- Only show obsidian.nvim statusline when editing markdown
							if vim.bo.filetype == "markdown" then
								return vim.g.obsidian
							end
							return ""
						end,
					},
					{ "filename" },
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = {},
				lualine_z = { "encoding" },
			},
		})
	end,
}
