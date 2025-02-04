return {
	"cdelledonne/vim-cmake",
	config = function()
		vim.keymap.set("n", "<leader>cg", ":CMakeGenerate <CR>", {})
		vim.keymap.set("n", "<leader>cb", ":CMakeBuild <CR>", {})
		vim.keymap.set("n", "<leader>cq", ":CMakeClose <CR>", {})
    vim.keymap.set('n',"<leader>cs", function ()
      local a = vim.fn.execute("CMakeGenerate")
     while true do
      if a == nil then
        vim.cmd("CMakeBuild")
        break
        else
          print("command not ")
      end
     end
    end)
  end,
}
