return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pylsp" }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
	  local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)
      end

      -- Setup for Lua LSP
      lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities
			})

      -- Setup for Python LSP with trailing whitespace warnings disabled
      lspconfig.pylsp.setup({
        on_attach = on_attach,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "E265", "E231", "E225", "E261", "W293", "E302", "E303", "E222", "E262", "E305", "W291", "E501","W391", "E202", "E225", "E114", "E201" }, -- Ignore trailing whitespace warnings
              },
            },
          },
        },
      })
    end,
  },
}

