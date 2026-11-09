return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                },

                follow_current_file = {
                    enabled = true,
                },
                hijack_netrw_behavior = "open_default",
            },
        })

        -- keymaps
        vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
        vim.keymap.set("n", "<leader>r", "<cmd>Neotree reveal<CR>", { desc = "Reveal file in NeoTree" })

        vim.api.nvim_create_autocmd("VimEnter", {
            group = vim.api.nvim_create_augroup("NeoTreeAutoOpen", { clear = true }),
            callback = function ()
                if vim.fn.argc() >= 1 then
                    local arg = vim.fn.argv(0)
                    if vim.fn.isdirectory(arg) == 0 then
                        vim.cmd("Neotree show")
                        vim.cmd("wincmd p")
                    end
                end
            end,
        })
    end,
}
