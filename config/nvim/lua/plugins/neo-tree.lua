return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({}) -- Ensure Neo-tree is properly set up
        vim.keymap.set('n', "<S-t>", ":Neotree filesystem reveal left<CR>", { noremap = true, silent = true })
    end
}

