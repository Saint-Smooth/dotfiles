vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--To compile C using shortcuts
vim.api.nvim_set_keymap('n', '<leader>cl', ':w<CR>:!clang % -o %:r && ./%:r<CR>', { noremap = true, silent = true })

