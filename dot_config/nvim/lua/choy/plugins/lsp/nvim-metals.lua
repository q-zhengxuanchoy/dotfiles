return {
	"scalameta/nvim-metals",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	ft = { "scala", "sbt", "java" },
	opts = function()
		local function metals_status_handler(err, status, ctx)
			local val = {}
			-- trim and remove spinner
			local text = status.text:gsub("[⠇⠋⠙⠸⠴⠦]", ""):gsub("^%s*(.-)%s*$", "%1")
			if status.hide then
				val = { kind = "end" }
			elseif status.show then
				val = { kind = "begin", title = text }
			elseif status.text then
				val = { kind = "report", message = text }
			else
				return
			end
			local msg = { token = "metals", value = val }
			vim.lsp.handlers["$/progress"](err, msg, ctx)
		end
		local metals_config = require("metals").bare_config()
		metals_config.on_attach = function(client, bufnr)
			-- your on_attach function
		end
		metals_config.init_options.statusBarProvider = "off"
		metals_config.handlers = { ["metals/status"] = metals_status_handler }
		return metals_config
	end,
	config = function(self, metals_config)
		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = self.ft,
			callback = function()
				require("metals").initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end,
}
