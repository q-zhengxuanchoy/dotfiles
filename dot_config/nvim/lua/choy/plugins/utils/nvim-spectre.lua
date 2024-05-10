-- TODO: adjust config for spectre search and replace
return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = true,
}
