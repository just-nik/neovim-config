local keys = {
  {
    "<C-p>",
    function()
      require("telescope.builtin").find_files({ hidden = true })
    end,
    desc = "fuzzy file finder",
  },
  {
    "<Leader>fg",
    function()
      require("telescope.builtin").live_grep({ hidden = true })
    end,
    desc = "grep live",
  },
}

return keys
