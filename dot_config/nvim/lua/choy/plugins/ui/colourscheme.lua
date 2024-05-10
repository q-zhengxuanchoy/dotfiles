-- TODO: clean up theme, add themes to other plugin like catppuccin
return {
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		lazy = true,
		config = function()
			vim.g.gruvbox_material_better_performance = 1
			-- Fonts
			vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_enable_italic = 0
			vim.g.gruvbox_material_enable_bold = 0
			vim.g.gruvbox_material_transparent_background = 1
			-- Themes
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_ui_contrast = "high" -- The contrast of line numbers, indent lines, etc.
			vim.g.gruvbox_material_float_style = "dim" -- Background of floating windows
		end,
	},

	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		opts = {
			commentStyle = { italic = false, bold = false },
			keywordStyle = { italic = false, bold = false },
			statementStyle = { italic = false, bold = false },
			functionStyle = { italic = false, bold = false },
			typeStyle = { italic = false, bold = false },
			background = { dark = "dragon", light = "lotus" },
			colors = {
				theme = {
					all = {
						ui = { bg_gutter = "none" },
						diff = {
							add = "none",
							change = "none",
							delete = "none",
							text = "none",
						},
					},
				},
			},
			overrides = function(colors)
				local theme = colors.theme
				local palette = colors.palette

				return {
					-- Statusline
					StatusLine = { bg = theme.ui.bg_p2, fg = theme.ui.fg },
					--- modes
					StatusLineAccent = { bg = "none", fg = palette.sakuraPink },
					StatusLineInsertAccent = { bg = "none", fg = palette.springGreen },
					StatusLineVisualAccent = { bg = "none", fg = palette.peachRed },
					StatusLineReplaceAccent = { bg = "none", fg = palette.carpYellow },
					StatusLineCmdLineAccent = { bg = "none", fg = palette.crystalBlue },
					StatusLineTerminalAccent = { bg = "none", fg = palette.fujiGray },
					--- gitsigns
					StatusLineGitSignsAdd = { bg = theme.ui.bg_p2, fg = theme.vcs.added },
					StatusLineGitSignsChange = { bg = theme.ui.bg_p2, fg = theme.vcs.changed },
					StatusLineGitSignsDelete = { bg = theme.ui.bg_p2, fg = theme.vcs.removed },
					--- diagnostics
					StatusLineDiagnosticSignError = { bg = theme.ui.bg_p2, fg = theme.diag.error },
					StatusLineDiagnosticSignWarn = { bg = theme.ui.bg_p2, fg = theme.diag.warning },
					StatusLineDiagnosticSignInfo = { bg = theme.ui.bg_p2, fg = theme.diag.info },
					StatusLineDiagnosticSignHint = { bg = theme.ui.bg_p2, fg = theme.diag.hint },
					StatusLineDiagnosticSignOk = { bg = theme.ui.bg_p2, fg = theme.diag.ok },

					NormalFloat = { bg = theme.ui.bg_p1 },
					FloatBorder = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					FloatTitle = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, bold = false },
					FloatFooter = { fg = theme.ui.nontext, bg = theme.ui.bg_p1 },

					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },

					CursorLineNr = { bold = false },
					Title = { bold = false },
					Boolean = { bold = false },
					MatchParen = { bold = false },
					IblIndent = { fg = theme.ui.bg_p1 },
					IblScope = { fg = theme.ui.whitespace },
					["@variable.builtin"] = { link = "Special" },
					["@lsp.typemod.function.readonly"] = { link = "Function" },
					["@boolean"] = { link = "Boolean" },
					["@keyword.operator"] = { link = "Keyword" },
					["@string.escape"] = { link = "PrePoc" },
					typescriptParens = { bg = "none" },
				}
			end,
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg_dark
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})
		end,
	},
	-- catppuccin
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				markdown = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				-- Recommended - see "Configuring" below for more config options
				transparent = true,
				italic_comments = true,
				hide_fillchars = true,
				borderless_telescope = true,
				terminal_colors = true,
			})
		end,
	},
}
