vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

require("config.vars")
require("config.mappings")
require("config.autocommands")

vim.cmd("colorscheme catppuccin")
vim.cmd("highlight Conditional cterm=NONE gui=NONE") -- Remove italics from conditionals, I don't like it
