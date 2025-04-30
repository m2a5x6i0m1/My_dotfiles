vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	root_markers = { ".git" },
})

vim.lsp.enable("nixd")
vim.lsp.enable("bashls")
vim.lsp.enable("harper-ls")
vim.lsp.enable("luals")
vim.lsp.enable("clangd")
vim.lsp.enable("rust-analyzer")
