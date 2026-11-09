vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = false
opt.background = "light"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.spell = true
opt.spelllang = "en_gb"
