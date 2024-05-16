-- adding luarocks path to package.path for image.nvim, we need this before we load the plugins
package.path = package.path
	.. ";"
	.. vim.fn.expand("$HOME")
	.. "/.local/share/nvim/lazy/luarocks.nvim/.rocks/share/lua/5.1/?/init.lua"
package.path = package.path
	.. ";"
	.. vim.fn.expand("$HOME")
	.. "/.local/share/nvim/lazy/luarocks.nvim/.rocks/share/lua/5.1/?.lua"

require("choy.core")
require("choy.lazy")

-- refer to colorscheme.lua in plugins for name of available themes
-- catppuccin
-- gruvbox-material
-- tokyonight
-- kanagawa
-- cyberdream
vim.cmd.colorscheme("cyberdream")
-- require("arrow.persist").load_cache_file()
-- TODO: implement noice alongside fidget. implement metals
