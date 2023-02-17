return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } },
        keys = {
            { "<C-p>",     "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>/", "<cmd>Telescope live_grep<cr>",  desc = "Find word" },
            {
                "<leader>fs",
                function()
                    require("telescope.builtin").grep_string { search = vim.fn.input "Grep > " }
                end,
                desc = "[F]ind [S]tring",
            },
            {
                "<leader>fk",
                "<cmd> Telescope keymaps<cr>",
                desc = "[F]ind [K]eymap",
            },
            {
                "<leader>fb",
                "<cmd> Telescope current_buffer_fuzzy_find<cr>",
                desc = "[F]ind in current [B]buffer",
            },

            -- LSP Pickers
            {
                "<leader>fr",
                "<cmd> Telescope lsp_references<cr>",
                desc = "[F]ind LSP [R]eferences",
            },
            {
                "<leader>fdo",
                "<cmd> Telescope lsp_document_symbols<cr>",
                desc = "[F]ind LSP [Do]cument symbols",
            },
            {
                "<leader>fdi",
                "<cmd> Telescope diagnostics<cr>",
                desc = "[F]ind LSP [Di]agnostic",
            },
            {
                "<leader>fi",
                "<cmd> Telescope lsp_implementations<cr>",
                desc = "[F]ind LSP [I]mplementations",
            },
            {
                "<leader>fd",
                "<cmd> Telescope lsp_definitions<cr>",
                desc = "[F]ind LSP [D]efinitions",
            },
        },
        cmd = "Telescope",
    },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable "make" == 1,
    },
}
