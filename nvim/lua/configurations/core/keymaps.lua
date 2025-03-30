vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>|", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>=", "<C-w>=", { desc = "Make split windows equal" })
keymap.set("n", "<leader>x", "<cmd>close<CR>", { desc = "Close current pane" })

keymap.set("n", "<leader>o", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>n", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>p", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>f", "<cmd>close<CR>", { desc = "Open current buffer in new tab" })

keymap.set("n", "<leader>e", ":NERDTreeToggle<CR>", { desc = "Open Nerdtree explorer" })
keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to the left pane" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move down to the pane below" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move up to the pane above" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to the right pane" })
