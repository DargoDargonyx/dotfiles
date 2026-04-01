-- lua/settings.lua
local set = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tabs

set.expandtab = false
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.smartindent = true

-- Misc

set.termguicolors = true
set.scrolloff = 10
set.clipboard = "unnamedplus"
set.mouse = "a"
set.fileformats = unix, dos

-- Line numbers

set.number = true
set.cursorline = true
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#185858" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#00FFFF", bold = true })
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#185858" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#185858" })
	end,
})
vim.opt.number = true
vim.opt.relativenumber = true
local augroup = vim.api.nvim_create_augroup("RelativeNumberToggle", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	group = augroup,
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	group = augroup,
	callback = function()
		vim.opt.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd("FocusLost", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("FocusGained", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- File formatting

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

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tabs

set.expandtab = false
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.smartindent = true

-- Misc

set.termguicolors = true
set.scrolloff = 10
set.clipboard = "unnamedplus"
set.mouse = "a"
set.fileformats = unix, dos

-- Line numbers

set.number = true
set.cursorline = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "#000000" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
vim.opt.number = true
vim.opt.relativenumber = true
local augroup = vim.api.nvim_create_augroup("RelativeNumberToggle", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	group = augroup,
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	group = augroup,
	callback = function()
		vim.opt.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd("FocusLost", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("FocusGained", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- File formatting

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
