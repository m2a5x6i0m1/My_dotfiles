-- Highlighting yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = false }

		opts.desc = "Show documentation for what is under cursor"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Show LSP references"
		vim.keymap.set("n", "gr", "<cmd>lua Snacks.picker.lsp_references()<CR>", opts) -- The best

		opts.desc = "Go to declaration"
		vim.keymap.set("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<CR>", opts)

		opts.desc = "Show LSP definitions"
		vim.keymap.set("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<CR>", opts)

		opts.desc = "Show LSP implementations"
		vim.keymap.set("n", "gi", "<cmd>lua Snacks.picker.lsp_implementations()<CR>", opts)

		opts.desc = "Show LSP type definitions"
		vim.keymap.set("n", "gy", "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>", opts)

		opts.desc = "Restart LSP"
		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

		opts.desc = "Smart rename"
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostics"
		vim.keymap.set("n", "<leader>db", "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>", opts)

		opts.desc = "Show line diagnostics"
		vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)

		opts.desc = "See available code actions"
		vim.keymap.set({ "n", "v" }, "<leader>da", vim.lsp.buf.code_action, opts)
	end,
})
