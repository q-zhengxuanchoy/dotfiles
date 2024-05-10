-- -- TODO: change to slanted theme
-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		local lualine = require("lualine")
-- 		-- lazy component for pending updates
-- 		local lazy_status = require("lazy.status")
-- 		-- arrow status line helper
-- 		local arrow = function(props)
-- 			local bufnr = props.buf
-- 			return require("arrow.statusline").text_for_statusline_with_icons(bufnr)
-- 		end
-- 		-- molten statusline helper
-- 		local molten = function()
-- 			return require("molten.status").initialized()
-- 		end
-- 		local kernel = function()
-- 			return require("molten.status").kernels()
-- 		end
-- 		local colors = {
-- 			blue = "#65D1FF",
-- 			green = "#3EFFDC",
-- 			violet = "#FF61EF",
-- 			yellow = "#FFDA7B",
-- 			red = "#FF4A4A",
-- 			fg = "#c3ccdc",
-- 			bg = "#112638",
-- 			inactive_bg = "#2c3043",
-- 		}
--
-- 		local my_lualine_theme = {
-- 			normal = {
-- 				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			insert = {
-- 				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			visual = {
-- 				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			command = {
-- 				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			replace = {
-- 				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			inactive = {
-- 				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
-- 				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
-- 				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
-- 			},
-- 		}
--
-- 		-- configure lualine with modified theme
-- 		lualine.setup({
-- 			options = {
-- 				theme = my_lualine_theme,
-- 			},
-- 			sections = {
-- 				lualine_a = { "mode" },
-- 				lualine_b = { "filename", { arrow } },
-- 				lualine_c = { { molten }, { kernel } }, -- Same, but with an bow and arrow icon ;D
-- 				lualine_x = {
-- 					{
-- 						lazy_status.updates,
-- 						cond = lazy_status.has_updates,
-- 						color = { fg = "#ff9e64" },
-- 					},
-- 					{ "encoding" },
-- 					{ "fileformat" },
-- 					{ "filetype" },
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
--
-- slanted theme
--
-- -- TODO: slanted thene, config it
-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		local lualine = require("lualine")
-- 		-- lazy component for pending updates
-- 		local lazy_status = require("lazy.status")
-- 		-- arrow status line helper
-- 		local arrow = function(props)
-- 			local bufnr = props.buf
-- 			return require("arrow.statusline").text_for_statusline_with_icons(bufnr)
-- 		end
-- 		-- molten statusline helper
-- 		local molten = function()
-- 			return require("molten.status").initialized()
-- 		end
-- 		local kernel = function()
-- 			return require("molten.status").kernels()
-- 		end
-- 		local colors = {
-- 			red = "#ca1243",
-- 			grey = "#a0a1a7",
-- 			black = "#383a42",
-- 			white = "#f3f3f3",
-- 			light_green = "#83a598",
-- 			orange = "#fe8019",
-- 			green = "#8ec07c",
-- 		}
--
-- 		local theme = {
-- 			normal = {
-- 				a = { fg = colors.white, bg = colors.black },
-- 				b = { fg = colors.white, bg = colors.grey },
-- 				c = { fg = colors.black, bg = colors.white },
-- 				z = { fg = colors.white, bg = colors.black },
-- 			},
-- 			insert = { a = { fg = colors.black, bg = colors.light_green } },
-- 			visual = { a = { fg = colors.black, bg = colors.orange } },
-- 			replace = { a = { fg = colors.black, bg = colors.green } },
-- 		}
--
-- 		local empty = require("lualine.component"):extend()
-- 		function empty:draw(default_highlight)
-- 			self.status = ""
-- 			self.applied_separator = ""
-- 			self:apply_highlights(default_highlight)
-- 			self:apply_section_separators()
-- 			return self.status
-- 		end
--
-- 		-- Put proper separators and gaps between components in sections
-- 		local function process_sections(sections)
-- 			for name, section in pairs(sections) do
-- 				local left = name:sub(9, 10) < "x"
-- 				for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
-- 					table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
-- 				end
-- 				for id, comp in ipairs(section) do
-- 					if type(comp) ~= "table" then
-- 						comp = { comp }
-- 						section[id] = comp
-- 					end
-- 					comp.separator = left and { right = "" } or { left = "" }
-- 				end
-- 			end
-- 			return sections
-- 		end
--
-- 		local function search_result()
-- 			if vim.v.hlsearch == 0 then
-- 				return ""
-- 			end
-- 			local last_search = vim.fn.getreg("/")
-- 			if not last_search or last_search == "" then
-- 				return ""
-- 			end
-- 			local searchcount = vim.fn.searchcount({ maxcount = 9999 })
-- 			return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
-- 		end
--
-- 		local function modified()
-- 			if vim.bo.modified then
-- 				return "+"
-- 			elseif vim.bo.modifiable == false or vim.bo.readonly == true then
-- 				return "-"
-- 			end
-- 			return ""
-- 		end
--
-- 		lualine.setup({
-- 			options = {
-- 				theme = theme,
-- 				component_separators = "",
-- 				section_separators = { left = "", right = "" },
-- 			},
--
-- 			-- 			sections = {
-- 			-- 				lualine_a = { "mode" },
-- 			-- 				lualine_b = { "filename", { arrow } },
-- 			-- 				lualine_c = { { molten }, { kernel } }, -- Same, but with an bow and arrow icon ;D
-- 			-- 				lualine_x = {
-- 			-- 					{
-- 			-- 						lazy_status.updates,
-- 			-- 						cond = lazy_status.has_updates,
-- 			-- 						color = { fg = "#ff9e64" },
-- 			-- 					},
-- 			-- 					{ "encoding" },
-- 			-- 					{ "fileformat" },
-- 			-- 					{ "filetype" },
-- 			-- 				},
-- 			sections = process_sections({
-- 				lualine_a = { "mode" },
-- 				lualine_b = {
-- 					"branch",
-- 					"diff",
-- 					{
-- 						"diagnostics",
-- 						source = { "nvim" },
-- 						sections = { "error" },
-- 						diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
-- 					},
-- 					{
-- 						"diagnostics",
-- 						source = { "nvim" },
-- 						sections = { "warn" },
-- 						diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
-- 					},
-- 					{ "filename", file_status = false, path = 1 },
-- 					{ modified, color = { bg = colors.red } },
-- 					{
-- 						"%w",
-- 						cond = function()
-- 							return vim.wo.previewwindow
-- 						end,
-- 					},
-- 					{
-- 						"%r",
-- 						cond = function()
-- 							return vim.bo.readonly
-- 						end,
-- 					},
-- 					{
-- 						"%q",
-- 						cond = function()
-- 							return vim.bo.buftype == "quickfix"
-- 						end,
-- 					},
-- 					{ arrow },
-- 				},
-- 				lualine_c = { { molten }, { kernel } },
-- 				lualine_x = {
-- 					{
-- 						lazy_status.updates,
-- 						cond = lazy_status.has_updates,
-- 						color = { fg = "#ff9e64" },
-- 					},
-- 					{ "encoding" },
-- 					{ "fileformat" },
-- 					{ "filetype" },
-- 				},
-- 				-- lualine_y = { search_result, "filetype" },
-- 				lualine_z = { "%l:%c", "%p%%/%L" },
-- 			}),
-- 			inactive_sections = {
-- 				lualine_c = { "%f %y %m" },
-- 				lualine_x = {},
-- 			},
-- 		})
-- 	nd,
-- }

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local colors = require("cyberdream.colors").default
		local cyberdream = require("lualine.themes.cyberdream")
		local copilot_colors = {
			[""] = { fg = colors.grey, bg = colors.none },
			["Normal"] = { fg = colors.grey, bg = colors.none },
			["Warning"] = { fg = colors.red, bg = colors.none },
			["InProgress"] = { fg = colors.yellow, bg = colors.none },
		}

		-- arrow status line helper
		local arrow = function(props)
			local bufnr = props.buf
			return require("arrow.statusline").text_for_statusline_with_icons(bufnr)
		end
		return {
			options = {
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				theme = cyberdream,
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = "󰝶 ",
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{
						"filename",
						symbols = { modified = "  ", readonly = "", unnamed = "" },
					},
					{ arrow },
					{
						function()
							return require("nvim-navic").get_location()
						end,
						cond = function()
							return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
						end,
						color = { fg = colors.grey, bg = colors.none },
					},
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = colors.green },
					},
					{
						function()
							local icon = " "
							local status = require("copilot.api").status.data
							return icon .. (status.message or "")
						end,
						cond = function()
							local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
							return ok and #clients > 0
						end,
						color = function()
							if not package.loaded["copilot"] then
								return
							end
							local status = require("copilot.api").status.data
							return copilot_colors[status.status] or copilot_colors[""]
						end,
					},
					{ "diff" },
				},
				lualine_y = {
					{
						"progress",
					},
					{
						"location",
						color = { fg = colors.cyan, bg = colors.none },
					},
				},
				lualine_z = {
					function()
						return "  " .. os.date("%X") .. " 🚀 "
					end,
				},
			},

			extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
		}
	end,
}
