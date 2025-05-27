local builtin = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		layout_config = {
			width = 0.50,
			height = 0.50,
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			previewer = false,
			file_ignore_patterns = {
				"node_modules",
                ".venv"
			}
		},
		git_files = {
			previewer = false,
		},
		buffers = {
			show_all_buffers = true,
		},
		live_grep = {
			previewer = false,
			theme = "dropdown",
		},
	},
})

vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fe", builtin.find_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
