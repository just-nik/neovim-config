local keys = {
  {
    "<Leader>r",
    function()
      vim.lsp.buf.rename()
    end,
    desc = "Rename variable using LSP",
  },
}

return keys
