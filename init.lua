require('statusline')

-- These are my vim options
vim.o.number = true
vim.o.ignorecase = true
vim.o.smartindent = true
vim.o.cindent = true
vim.o.linebreak = false
vim.o.relativenumber = false
vim.o.wrap = false
vim.o.laststatus = 3
vim.o.wildmenu = true
vim.o.scrolloff = 10 
vim.o.showmode = false
vim.o.termguicolors = true
-- Apply themes here
vim.cmd("colorscheme gruvbox")
-- Allows VIM to access clipboard
vim.o.clipboard = 'unnamedplus'


-- My Custom Hightlights
vim.cmd([[
	hi StatuslineInsertAccent guifg=White guibg=Green gui=bold
	hi StatuslineVisualAccent guifg=Black guibg=Yellow gui=bold
	hi StatuslineCmdlineAccent guifg=White guibg=#4169E1 gui=bold
]])

