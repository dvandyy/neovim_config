require("nvim-treesitter.configs").setup({
	-- A list of parser names, or 'all'
	ensure_installed = { "javascript", "typescript", "python", "go", "dockerfile", "rust" },

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
