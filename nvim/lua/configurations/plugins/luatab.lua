return {
	"alvarosevilla95/luatab.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local luatab = require("luatab")
		luatab.setup({
			fileIcon = function(bufnr)
				local devicons = require("nvim-web-devicons")
				local name = vim.fn.bufname(bufnr)
				local extension = vim.fn.fnamemodify(name, ":e")
				local icon, _ = devicons.get_icon(name, extension, { default = true })
				return icon and (icon .. " ") or ""
			end,
			modified = function(bufnr)
				return vim.bo[bufnr].modified and "[+]" or ""
			end,
			separator = function(index)
				return index < vim.fn.tabpagenr("$") and "│" or ""
			end,
			tab_max_length = 20,
			title = function(bufnr)
				local name = vim.fn.bufname(bufnr)
				local buftype = vim.bo[bufnr].buftype
				local filetype = vim.bo[bufnr].filetype
				if buftype == "help" then
					return "help:" .. vim.fn.fnamemodify(name, ":t:r")
				elseif buftype == "quickfix" then
					return "quickfix"
				elseif filetype == "TelescopePrompt" then
					return "Telescope"
				elseif buftype == "terminal" then
					local _, mtch = string.match(name, "term:(.*):(%a+)")
					return mtch ~= nil and mtch or vim.fn.fnamemodify(vim.env.SHELL, ":t")
				elseif name == "" then
					return "[No Name]"
				end
				return vim.fn.fnamemodify(name, ":t")
			end,
		})
	end,
}
