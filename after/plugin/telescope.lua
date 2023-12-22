local builtin = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		layout_config = {
			vertical = { width = 0.8, max = 70, min = 123 },
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			layout_config = {
				height = 0.70,
			},
		},
		buffers = {
			show_all_buffers = true,
		},
		live_grep = {
			previewer = false,
			theme = "dropdown",
		},
		git_status = {
			git_icons = {
				added = " ",
				changed = " ",
				copied = " ",
				deleted = " ",
				renamed = "➡",
				unmerged = " ",
				untracked = " ",
			},
			previewer = false,
			theme = "dropdown",
		},
	},
})

vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fe", builtin.find_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
