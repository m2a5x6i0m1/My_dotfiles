-- Must have
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.wrap = false

-- Line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- Shows absolute line number on cursor line (when relative number is on)

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- tabs & indentation
vim.opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- Copy indent from current line when starting new one

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- If you include mixed case in your search, assumes you want case-sensitive

-- cursor line
vim.opt.cursorline = true
vim.opt.scrolloff = 5

-- appearance
vim.opt.termguicolors = true -- true color support
vim.opt.signcolumn = "yes" -- Show sign column so that text doesn't shift
vim.opt.conceallevel = 0

-- split windows
vim.opt.splitright = true -- Split vertical window to the right
vim.opt.splitbelow = true -- Split horizontal window to the bottom

-- Better diagnostic
vim.diagnostic.config({
	virtual_lines = {
		source = true,
		current_line = true,
		underline = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

-- Different shell config for Neovim
vim.fn.setenv("ZDOTDIR", "/home/max/.config/nvim/shell")
vim.opt.shell = "zsh"
