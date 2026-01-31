vim.opt.number = true          
vim.opt.relativenumber = true  
vim.opt.mouse = 'a'            
vim.opt.ignorecase = true      
vim.opt.smartcase = true       
vim.g.mapleader = ";"      
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "rose-pine/neovim",
  "nvim-telescope/telescope.nvim",  
  "nvim-lua/plenary.nvim",          
})

vim.cmd("colorscheme rose-pine-main")

local keymap = vim.keymap.set

keymap('n', '<leader>ff', ':Telescope find_files<CR>')
keymap('n', '<leader>fg', ':Telescope live_grep<CR>')

keymap('n', '<leader>nh', ':nohlsearch<CR>')

keymap('n', '<leader>w', ':w<CR>')
keymap('n', '<leader>q', ':q<CR>')
