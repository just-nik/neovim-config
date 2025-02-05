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
    dependencies = {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
    },
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
        -- the module used in on_attach is not updated anymore then if you
        -- see any pesky errors remove the following block of code
        on_attach = function(client, bufnr)
          require("nvim-lsp-ts-utils").setup({
            filter_out_diagnostics_by_code = { 80001 },
          })
          require("nvim-lsp-ts-utils").setup_client(client)
        end,
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
