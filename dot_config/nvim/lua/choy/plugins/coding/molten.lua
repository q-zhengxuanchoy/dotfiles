if vim.fn.has("win32") > 0 then -- wezterm for image backend if windows, kitty on unix
	return {
		"benlubas/molten-nvim",
		version = "*", -- use version <2.0.0 to avoid breaking changes
		build = ":UpdateRemotePlugins",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"willothy/wezterm.nvim",
		},
		init = function()
			require("choy.plugins.configs.molten-configs") -- splitting out config file for conciseness
		end,
	}
else
	return {
		"benlubas/molten-nvim",
		version = "*", -- use version <2.0.0 to avoid breaktfining changes
		build = ":UpdateRemotePlugins",
		event = { "BufReadPre", "BufNewFile" },
		init = function()
			require("choy.plugins.configs.molten-configs")
		end,
	}
end
