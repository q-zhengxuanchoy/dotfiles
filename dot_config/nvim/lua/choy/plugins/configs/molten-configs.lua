vim.g.molten_auto_open_output = false -- cannot be true if molten_image_provider = "wezterm"
vim.g.molten_output_show_more = true
if vim.fn.has("win32") > 0 then
	vim.g.molten_image_provider = "wezterm"
else
	vim.g.molten_image_provider = "image.nvim"
end
vim.g.molten_output_virt_lines = true
vim.g.molten_split_direction = "right" --direction of the output window, options are "right", "left", "top", "bottom"
vim.g.molten_split_size = 40 --(0-100) % size of the screen dedicated to the output window
vim.g.molten_virt_text_output = true
vim.g.molten_use_border_highlights = true
vim.g.molten_virt_lines_off_by_1 = true
vim.g.molten_auto_image_popup = false
local keymap = vim.keymap -- for conciseness
keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
keymap.set("n", "<localleader>l", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
keymap.set("n", "<localleader>c", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
keymap.set("n", "<localleader>o", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "show floating output" })
keymap.set(
	"v",
	"<localleader>mc",
	":<C-u>MoltenEvaluateVisual<CR>gv",
	{ silent = true, desc = "evaluate visual selection" }
)
-- TODO: fix the pattern matching logic
keymap.set("n", "<localleader>ip", function()
	local venv = os.getenv("VIRTUAL_ENV")
	print(venv)
	if venv ~= nil then
		-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
		-- venv = string.match(venv, "/.+/(.+)")
		venv = string.match(venv, "/.+/.+")
		print(venv)
		vim.cmd(("MoltenInit %s"):format(venv))
	else
		vim.cmd("MoltenInit python3")
	end
end, { desc = "Initialize Molten based on venv", silent = true })
