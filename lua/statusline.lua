vim.cmd([[
	hi StatuslineInsertAccent guifg=White guibg=Green gui=bold
	hi StatuslineVisualAccent guifg=Black guibg=Yellow gui=bold
	hi StatuslineCmdlineAccent guifg=White guibg=#4169E1 gui=bold
]])

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT", ["S"] = "SELECT LINE",
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

local mode_colors = {
	['n'] = "%#StatuslineAccent#",
	['i'] = "%#StatuslineInsertAccent#",
	['ic'] = "%#StatuslineInsertAccent#",
	['v'] = "%#StatuslineVisualAccent#",
	['V'] = "%#StatuslineVisualAccent#",
	['R'] = "%#StatuslineReplaceAccent#",
	['c'] = "%#StatuslineCmdlineAccent#",
	['t'] = "%#StatuslineTerminalAccent#",
}

function get_mode()
	local currentMode = vim.api.nvim_get_mode()
	return modes[currentMode.mode]
end

function get_proper_highlight()
	local currentMode = vim.api.nvim_get_mode().mode
	local mode_color = "%#StatuslineAccent"  
	if mode_colors[currentMode] then mode_color = mode_colors[currentMode] end
	return mode_color
end

vim.api.nvim_create_autocmd({"ModeChanged", "BufEnter"}, {
	pattern = {"*"},
	callback = function()
		local Statusline = table.concat {
			get_proper_highlight(),
			" " .. get_mode() .. " ",
			"%#Statusline# ",
			"%f",
		}
		vim.o.statusline = Statusline
	end
})
