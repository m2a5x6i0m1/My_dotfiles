return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {

		image = { enabled = false, formats = {} },
		words = { enabled = false },
		statuscolumn = { enabled = false },

		quickfile = { enabled = true },
		bigfile = { enabled = true },
		input = { enabled = true },
		terminal = { enabled = true },

		scope = {
			cursor = false,
		},

		indent = {
			indent = { char = "┊" },
			scope = { char = "┊" },
		},

		notifier = {
			timeout = 4000,
			margin = { top = 0, right = 0, bottom = 1 },
		},

		picker = {
			prompt = "  ",
			layout = {
				cycle = true,
				preset = "ivy_split",
			},
			formatters = {
				file = { icon_width = 3 },
			},
		},

		styles = {
			notification = {
				wo = { wrap = true },
			},
			lazygit = {
				width = 0,
				height = 0,
			},
		},
	},

	keys = {

		-- Top Pickers
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "List Buffers",
		},
		{
			"<leader>!",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},

		-- find
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Files",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.files({ cwd = "~/dotfiles", hidden = true })
			end,
			desc = "Dotfiles",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Config Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Search",
		},

		-- git
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},

		-- Others
		{
			"<leader>;",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
		},
		{
			"<leader>rf",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<C-/>",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle Terminal",
			mode = { "n", "t" },
		},
	},
	init = function()
		-- Recommended settings
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				Snacks.toggle.diagnostics():map("<leader>dt")
				Snacks.toggle.inlay_hints():map("<leader>dh")
			end,
		})

		-- Oil integration
		vim.api.nvim_create_autocmd("User", {
			pattern = "OilActionsPost",
			callback = function(event)
				if event.data.actions.type == "move" then
					Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
				end
			end,
		})
	end,
}
