vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

require("config.vars")
require("config.mappings")
require("config.autocommands")

vim.cmd("colorscheme habamax")
