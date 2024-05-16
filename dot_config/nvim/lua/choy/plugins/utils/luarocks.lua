-- use luarocks to download magick rock needed for image.nvim to work. refer to init.lua to put the rocks in package.path
-- only needed for unix system
if vim.fn.has("win32") == 0 then
	return {
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
	}
else
	return {}
end
