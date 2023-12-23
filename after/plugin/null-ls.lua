local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		null_ls.builtins.completion.spell,

		-- Lua
		formatting.stylua,

		-- Rust
		formatting.rustfmt,

		-- python
		formatting.black.with({
			extra_args = { "--line-length=120" },
		}),
		formatting.isort,

		formatting.prettier,
	},
})
