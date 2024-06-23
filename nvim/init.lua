require "options"
require "keymaps"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
require("lazy").setup ( {{import="plugins"}, {import="plugins.lsp"}}, {
  change_detection = {
    notify = false,
  },}
)

-- Define autocommands for Python files
vim.cmd([[
  augroup PythonAutocommands
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>r :w<CR>:belowright terminal python3 %<CR>
  augroup END
]])

