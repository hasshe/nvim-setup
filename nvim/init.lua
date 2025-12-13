vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'
  }
}
local opts = {}

require("lazy").setup(plugins, opts)
local builtin = require("telescope.builtin")
-- set ctrl p tp open search
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- set live grep to leader fg, which in tutorial was space bar. Is set at the top
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {'lua', 'javascript', 'rust'},
  highlight = { enalble = true },
  indent = { enable = true }
})

