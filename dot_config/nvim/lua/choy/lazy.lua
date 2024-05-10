-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require "lazy".setup({
  {import = "choy.plugins"},
  {import  = "choy.plugins.navigations"},
  {import = "choy.plugins.utils"},
  {import = "choy.plugins.ui"},
  {import = "choy.plugins.coding"},
  {import = "choy.plugins.lsp"},
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
