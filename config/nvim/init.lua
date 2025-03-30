-- Load basic options first
require "options"

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize plugins
require("lazy").setup("plugins")


-- Fold settings (MUST come before plugin setup)
vim.opt.foldmethod = "expr"               -- Use Treesitter for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99               -- Start with all folds open
--vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"  -- Nicer fold display
vim.opt.foldtext = [[v:folddashes.substitute(getline(v:foldstart),'\t',repeat(' ',&tabstop),'g')]]
vim.cmd([[
  highlight Folded guifg=#87cde0 guibg=#454747 gui=italic
]])

-- Optional: Better fold characters (requires NerdFont)
vim.opt.fillchars = {
  fold = " ",
  foldopen = "",  -- Down arrow icon
  foldclose = "", -- Right arrow icon
}

