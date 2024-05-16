-- use wezterm as image backend for molten if on windows
if vim.fn.has("win32") > 0 then
	return {
		"willothy/wezterm.nvim",
		event = "VeryLazy",
		opts = {
			create_commands = false,
		},
	}
else
	return {}
end
