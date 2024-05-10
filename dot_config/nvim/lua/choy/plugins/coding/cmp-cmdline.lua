return {
	"hrsh7th/cmp-cmdline", -- search autocompletion
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-buffer", -- buffer for cmdline search autocompletion
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		-- work around for : command auto complete failing after using / search command auto complete once
		local function send_wildchar()
			local char = vim.fn.nr2char(vim.opt.wildchar:get())
			local key = vim.api.nvim_replace_termcodes(char, true, false, true)
			vim.api.nvim_feedkeys(key, "nt", true)
		end
		cmp.setup.cmdline(":", {
			mapping = {
				["<Tab>"] = { c = send_wildchar },
			},
			sources = cmp.config.sources({}),
		})
		-- `:` cmdline setup.
		-- cmp.setup.cmdline(":", {
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = cmp.config.sources({
		-- 		{ name = "path" },
		-- 	}, {
		-- 		{
		-- 			name = "cmdline",
		-- 			option = {
		-- 				ignore_cmds = { "Man", "!" },
		-- 			},
		-- 		},
		-- 	}),
		-- })
	end,
}
