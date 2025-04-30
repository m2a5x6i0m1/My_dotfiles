return {
	{
		"echasnovski/mini.bracketed",
		version = false,
		config = function()
			require("mini.bracketed").setup({
				diagnostic = { options = { float = false } },
			})
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = { "BufReadPre", "BufNewFile" },
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.splitjoin",
		event = { "BufReadPre", "BufNewFile" },
		version = false,
		config = function()
			require("mini.splitjoin").setup()
		end,
	},
	{
		"echasnovski/mini.ai",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "echasnovski/mini.extra", version = false },
		version = false,
		config = function()
			local gen_ai_spec = require("mini.extra").gen_ai_spec
			require("mini.ai").setup({
				custom_textobjects = {
					B = gen_ai_spec.buffer(),
					D = gen_ai_spec.diagnostic(),
					I = gen_ai_spec.indent(),
					L = gen_ai_spec.line(),
					N = gen_ai_spec.number(),
				},
			})
		end,
	},
}
