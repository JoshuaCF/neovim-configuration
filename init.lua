vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

require("config.autocommands")
require("config.mappings")
require("config.vars")

vim.cmd("colorscheme habamax")
