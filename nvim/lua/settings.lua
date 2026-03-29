-- lua/settings.lua
local set = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

set.expandtab = false
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.smartindent = true

set.number = true
set.cursorline = true

set.termguicolors = true
set.scrolloff = 8
set.clipboard = "unnamedplus"
set.mouse = "a"

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "javascript", "typescript", "html", "css" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		set.softtabstop = 2
		vim.opt_local.expandtab = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "rust", "c", "cpp" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		set.softtabstop = 4
		vim.opt_local.expandtab = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "haskell" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		set.softtabstop = 0
		vim.opt_local.expandtab = true
	end,
})
