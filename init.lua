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

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	[""] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

function getMode()
	local currentMode = vim.api.nvim_get_mode()
	return modes[currentMode.mode]
end

vim.cmd([[
	hi StatuslineInsertAccent guifg=#8cc85f guibg=Green gui=bold
	hi StatuslineVisualAccent guifg=White guibg=Yellow gui=bold
	hi Pussy guifg=White guibg=Black 
]])

vim.api.nvim_create_autocmd({"ModeChanged", "BufEnter"}, {
	pattern = {"*"},
	callback = function()
		local Statusline = table.concat {
			"%#StatuslineInsertAccent# ",
			getMode() .. " ",
			"%#Statusline# ",
			"pussy fresh",
		}
		vim.o.statusline = Statusline
	end
})



