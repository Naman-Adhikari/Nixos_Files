return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    auto_install = true,
    config = function()
        require('nvim-treesitter.configs').setup({
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = { "python" },
        })
    end
}
