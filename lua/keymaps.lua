--Theme changing key mapping
vim.keymap.set("n", "<leader>;", function()
  if string.find(vim.fn.execute("echo colors_name"), "nightfox") ~= nil then
    vim.cmd("colorscheme carbonfox")
  else
    vim.cmd("colorscheme nightfox")
  end
end)

--the good ol Ctrl + s
vim.keymap.set({ "n", "i" }, "<C-s>", function()
  vim.cmd("w")
end)

--adds new tabs
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("tabnew")
end)

--clear search
vim.keymap.set({ "i", "n" }, "<C-c>", function()
  vim.cmd("noh")
end)

--easy way to exit
vim.keymap.set("n", "qq", function()
  vim.cmd("wqa!")
end)

--lsp keymaps yuhoo!!
-- vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
