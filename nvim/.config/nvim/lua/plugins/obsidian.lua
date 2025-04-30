return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- Recommended, use latest release instead of latest commit
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			completion = {
				nvim_cmp = false,
				blink = true,
				min_chars = 2,
				score_offset = 100,
			},
			statusline = {
				enabled = true,
				format = "{{backlinks}} backlinks  {{words}} words",
			},
			ui = {
				enable = false,
				checkboxes = {
					[" "] = { char = "☐", hl_group = "ObsidianTodo" },
					["x"] = { char = "✔", hl_group = "ObsidianDone" },
				},
			},

			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Smart action depending on context: follow link, show notes with tag, toggle checkbox, or toggle heading fold
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			},

			daily_notes = {
				folder = "Daily",
				template = "Daily",
				default_tags = {},
			},

			dir = "~/notes",
			notes_subdir = "3 Resources",
			new_notes_location = "notes_subdir",
			templates = { folder = "Templates" },

			preferred_link_style = "wiki",
			picker = { name = "snacks.pick" },
			backlinks = { parse_headers = false },

			note_frontmatter_func = function(note)
				local out = { tags = note.tags, date = os.date("%Y-%m-%d") }
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end
				return out
			end,

			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will be given an ID that looks
				-- like '1657296016-my-new-note', and therefore the filename '1657296016-my-new-note.md'.
				-- You may have as many periods in the note ID as you'd like—the ".md" will be added automatically
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid filename.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,
		})

		vim.keymap.set("n", "<leader>nn", "<cmd>Obsidian new<cr>", { desc = "New" })
		vim.keymap.set("n", "<leader>nd", "<cmd>Obsidian today<cr>", { desc = "Daily note" })
		vim.keymap.set("n", "<leader>nN", "<cmd>Obsidian new_from_template<cr>", { desc = "New from template" })

		vim.keymap.set("n", "<leader>nT", "<cmd>Obsidian template<cr>", { desc = "Insert template" })
		vim.keymap.set("n", "<leader>nO", "<cmd>Obsidian open<cr>", { desc = "Open note with App" })
		vim.keymap.set("v", "<leader>ne", ":Obsidian extract_note", { desc = "Extract to new note" })

		vim.keymap.set("n", "<leader>nb", "<cmd>Obsidian backlinks<cr>", { desc = "Backlinks" })
		vim.keymap.set("n", "<leader>nl", "<cmd>Obsidian links<cr>", { desc = "Outgoing links" })
		vim.keymap.set("n", "<leader>nt", "<cmd>Obsidian tags<cr>", { desc = "Tags" })

		vim.keymap.set("n", "<leader>nf", "<cmd>Obsidian quick_switch<cr>", { desc = "Find note" })
		vim.keymap.set("n", "<leader>ns", "<cmd>Obsidian search<cr>", { desc = "Search through notes" })
		vim.keymap.set("n", "<leader>nr", "<cmd>Obsidian rename<cr>", { desc = "Rename note" })
	end,
}
