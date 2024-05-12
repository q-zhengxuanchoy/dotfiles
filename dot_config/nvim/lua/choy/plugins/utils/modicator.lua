return {
	"mawkler/modicator.nvim",
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		-- These are required for Modicator to work
		vim.o.cursorline = true
		vim.o.number = true
		vim.o.termguicolors = true
	end,
	opts = {
		integration = {
			lualine = {
				enabled = true,
				highlight = "fg",
			},
		},
	},
}
