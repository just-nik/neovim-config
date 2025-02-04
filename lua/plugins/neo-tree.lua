return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set({ "n", "i" }, "<C-n>", function()
			vim.fn.execute("Neotree filesystem reveal left")
		end, {})
	end,
}

-- :Neotree filesystem reveal left<CR>
