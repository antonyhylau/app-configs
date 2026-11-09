return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        {
            "folke/lazydev.nvim",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = ev.buf, silent = true, desc = desc })
                end

                map("gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
                map("gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
                map("gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
                map("gt", "<cmd>Telescope lsp_type_definitions<CR>", "See LSP type definitions")
                map("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")

                map("gD", vim.lsp.buf.declaration, "Go to declaration")
                map("<leader>ca", vim.lsp.buf.code_action, "See available code actions", { "n", "v" })
                map("<leader>rn", vim.lsp.buf.rename, "Smart rename")
                map("<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
                map("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Go to previous diagnostic")
                map("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Go to next diagnostic")
                map("K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
                map("<leader>rs", ":LspRestart<CR>", "Restart LSP")
            end,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.lsp.config("*",  {
            capabilities = capabilities,
        })

        local lspconfig = require("lspconfig")

        vim.lsp.config("lua_ls", {
            root_dir = lspconfig.util.root_pattern(".git", "init.lua") or vim.fn.getcwd(),
            settings = {
                Lua = {
                    completion = { callSnippet = "Replace" },
                    telemetry = { enable = false },
                },
            },
        })
        
        vim.lsp.config("gopls", {
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                        shadow = true,
                        unreachable = true,
                    },
                    staticcheck = true,
                },
            },
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = true
            end,
        })

        require("mason").setup()
        
        require("mason-lspconfig").setup({
            ensure_installed = {
                "gopls",
                "lua_ls",
                "pyright",
            },
            automatic_enable = true, 
        })
        
    end,
}
