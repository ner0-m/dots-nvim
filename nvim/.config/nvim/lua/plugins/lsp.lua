return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "jay-babu/mason-null-ls.nvim" },
        { "jose-elias-alvarez/null-ls.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Lock and feel
        { "onsails/lspkind.nvim" },
        { "ray-x/lsp_signature.nvim" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
        { "SmiteshP/nvim-navic" },

        -- clangd extension
        { "p00f/clangd_extensions.nvim" },
    },
    config = function()
        local lsp = require "lsp-zero"

        lsp.preset "recommended"

        lsp.ensure_installed {
            "clangd",
            "lua_ls",
            "cmake",
        }

        -- Fix Undefined global 'vim'
        lsp.configure("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        lsp.configure("clangd", {
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--cross-file-rename",
            },
            filetypes = { "c", "cpp", "objc", "objcpp", "cu", "cuh", "cuda" },
            capabilities = {
                offsetEncoding = { "utf-16" },
            },
        })

        require("clangd_extensions").setup()

        local cmp = require "cmp"
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = lsp.defaults.cmp_mappings {
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-y>"] = cmp.mapping.confirm { select = true },
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }

        -- disable completion with tab
        -- this helps with copilot setup
        cmp_mappings["<CR>"] = nil
        cmp_mappings["<Tab>"] = nil
        cmp_mappings["<S-Tab>"] = nil

        local lspkind = require "lspkind"
        lsp.setup_nvim_cmp {
            mapping = cmp_mappings,
            formatting = {
                format = lspkind.cmp_format {
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                },
            },
            experimental = {
                ghost_text = true,
            },
        }

        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            if client.name == "null-ls" then
                return
            end

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
            vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

            if client.name == "clangd" then
                buf_map(bufnr, "n", "<leader>lw", ":ClangdSwitchSourceHeader<cr>")
            end

            require("lsp_signature").on_attach({
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                handler_opts = {
                    border = "rounded",
                },
            }, bufnr)

            if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, bufnr)
            end

            if client.name == "clangd" then
                vim.keymap.set("n", "<leader>lw", vim.cmd.ClangdSwitchSourceHeader, opts)
            end
        end)

        lsp.setup()

        vim.diagnostic.config {
            virtual_text = true,
        }

        local null_ls = require "null-ls"
        null_ls.setup {
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.cmake_format,
                null_ls.builtins.formatting.latexindent,
                null_ls.builtins.formatting.stylua,

                null_ls.builtins.formatting.trim_newlines,
                null_ls.builtins.formatting.trim_whitespace,
                null_ls.builtins.formatting.codespell,

                null_ls.builtins.completion.spell,

                -- Diagnostics
                null_ls.builtins.diagnostics.codespell,
                null_ls.builtins.diagnostics.cspell,
                -- null_ls.builtins.diagnostics.misspell,
                null_ls.builtins.diagnostics.proselint,
                null_ls.builtins.diagnostics.write_good,
                null_ls.builtins.diagnostics.pycodestyle,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.diagnostics.chktex,
                null_ls.builtins.diagnostics.commitlint,
                -- null_ls.builtins.diagnostics.luacheck,
                null_ls.builtins.diagnostics.markdownlint,
            },
        }

        require("mason-null-ls").setup {
            ensure_installed = nil,
            automatic_installation = true,
            automatic_setup = false,
        }

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })
    end,
}
