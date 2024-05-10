return {
	"ggandor/leap.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function(_, opts)
		local keymap = vim.keymap
		local leap = require("leap")
		for k, v in pairs(opts) do
			leap.opts[k] = v
		end
		-- leap.add_default_mappings(true)
		keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
		keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
		keymap.set({ "n", "x", "o" }, "df", "<Plug>(leap-from-window)")
	end,
}
