--make sure you install ripgrep for fuzzy finding
return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      -- vim.keymap.set("n", "<C-p>", function()
      -- 	vim.cmd([[lua require("telescope.builtin").find_files({hidden = true})]])
      -- end, {})
      -- vim.keymap.set("n", "<leader>fg", function()
      -- 	vim.cmd([[lua require("telescope.builtin").live_grep({hidden = true})]])
      -- end, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
