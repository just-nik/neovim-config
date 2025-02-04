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
        ensure_installed = { "lua_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    keys = require("after.keys.lsp-keys"),
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      --lspconfig.rust_analyzer.setup({
      --settings = {
      --["rust-analyzer"] = {
      --diagnostics = {
      -- enable = true,
      -- },
      -- },
      -- },
      -- })
      lspconfig.clangd.setup({})
      lspconfig.cssls.setup({})
      lspconfig.vimls.setup({})
      lspconfig.html.setup({})
      -- lspconfig.ccls.setup({})
      lspconfig.emmet_language_server.setup({})
      lspconfig.ts_ls.setup({
        -- init_options = {
        --   preferences = {
        --     disableSuggestions = false,
        --   },
        -- },
      })

      -- lspconfig.emmet_ls.setup({
      -- 	filetypes = { "html", "ejs" },
      -- })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
