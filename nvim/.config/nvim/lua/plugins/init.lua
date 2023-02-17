return {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "lervag/vimtex",

    {
        "rose-pine/neovim",
        priority = 1000,
        lazy = false,
        config = function()
            vim.cmd "colorscheme rose-pine"
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
        event = "BufEnter",
        lazy = true,
    },

    {
        "sedm0784/vim-you-autocorrect",
        keys = {
            { "<C-c>e", vim.cmd.EnableAutocorrect, mode = { "n", "i" }, desc = "[E]enable autocorrect" },
            { "<C-c>d", vim.cmd.DisableAutocorrect, mode = { "n", "i" }, desc = "[D]isable autocorrect" },
        },
        cmd = { "EnableAutocorrect", "DisableAutocorrect" },
    },

    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
        end,
        event = "BufEnter",
    },

    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("hlslens").setup()
        end,
    },

    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh",
            "DiffviewFileHistory",
        },
    },

    -- {
    --     "ThePrimeagen/harpoon",
    --     dependencies = "nvim-lua/plenary.nvim",
    --     lazy = false,
    -- },
}
