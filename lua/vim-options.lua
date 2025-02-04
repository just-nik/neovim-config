vim.cmd("set expandtab")
vim.o.signcolumn = "yes"
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard+=unnamedplus")
vim.o.statuscolumn = "%s %l %r"
vim.g.terminal_emulator = "kitty"
vim.opt.termguicolors = true
vim.cmd([[autocmd! CursorHold * lua vim.diagnostic.config({ virtual_lines = { only_current_line = true } })]])
vim.keymap.set("n", "<Space>r", ":resize 3<CR>", {})
vim.keymap.set("n", "<Space>t", "<C-w>s | <C-w>j :resize 3<CR> | :hor term<CR>| i", {})
--vim.cmd('autocmd BufNewFile,BufRead *.ejs set filetype=html')
vim.g.mapleader = " "
vim.g.cmake_link_compile_commands = 1
