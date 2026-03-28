-- lua/plugins/nvim-tree.lua
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup({
			sort_by = "name",
			view = {
				width = 30,
				side = "left",
			},
			renderer = {
				group_empty = true,
				highlight_git = true,
				icons = {
					show = {
						file = true,
						folder = true,
						git = true,
					},
				},
			},
			filters = {
				dotfiles = false,
				custom = { "^.git$" },
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = true,
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = " ",
					info = " ",
					warning = " ",
					error = " ",
				},
			},
		})

		vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	end,
}
