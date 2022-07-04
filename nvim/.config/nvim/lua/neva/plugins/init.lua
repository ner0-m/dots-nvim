-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "folke/tokyonight.nvim"

    -- Nicer search
    use {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require "neva.plugins.hlslens"
        end,
    }

    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require "neva.plugins.gitsigns"
        end,
    }

    use {
        "sedm0784/vim-you-autocorrect",
        config = function()
            require "neva.plugins.autocorrect"
        end,
        cmd = { "EnableAutocorrect", "DisableAutocorrect" },
    }

    use {
        "vhyrro/neorg",
        config = function()
            require "neva.plugins.neorg"
        end,
        requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    }

    use {
        "numToStr/Comment.nvim",
        config = function()
            require "neva.plugins.comment"
        end,
        event = "BufEnter",
    }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require "neva.plugins.todo"
        end,
    }

    use {
        "echasnovski/mini.nvim",
        config = function()
            require "neva.plugins.mini"
        end,
    }

    use {
        "wellle/targets.vim",
        event = "BufEnter",
    }

    use {
        "ggandor/leap.nvim",
        config = function()
            require "neva.plugins.leap"
        end,
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require "neva.plugins.treesitter"
        end,
    }

    use {
        "nvim-treesitter/playground",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    }

    use {
        "karb94/neoscroll.nvim",
        config = function()
            require "neva.plugins.neoscroll"
        end,
        event = "BufEnter",
    }

    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
        config = function()
            require "neva.plugins.navic"
        end,
    }

    use {
        "famiu/feline.nvim",
        after = { "nvim-navic", "tokyonight.nvim" },
        requires = {
            { "kyazdani42/nvim-web-devicons" },
        },
        config = function()
            require "neva.statusline"
        end,
    }

    use {
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require "neva.plugins.barbar"
        end,
        event = "BufEnter",
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            -- "rudism/telescope-dict.nvim", -- TODO: Use it and add keymapping
        },
        config = function()
            require "neva.plugins.telescope"
        end,
    }

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require "neva.plugins.luasnip"
        end,
        after = "nvim-cmp",
        event = "BufEnter",
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    use {
        "neovim/nvim-lspconfig",
        requires = {
            "ray-x/lsp_signature.nvim",
        },
        config = function()
            require "neva.lsp"
        end,
    }

    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require "neva.plugins.nvim-cmp"
        end,
    }

    use {
        "hrsh7th/cmp-buffer",
        requires = {
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "f3fora/cmp-spell",
            "onsails/lspkind-nvim",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require "neva.plugins.nvim-cmp"
        end,
        after = "nvim-cmp",
    }

    use {
        "nvim-orgmode/orgmode",
        config = function()
            require "neva.plugins.orgmode"
        end,
    }

    use {
        "~/src/nvim_plugins/cmp-git",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("cmp_git").setup {}
        end,
        after = "nvim-cmp",
    }

    use {
        "tweekmonster/startuptime.vim",
    }

    use {
        "danymat/neogen",
    }

    use {
        "petertriho/nvim-scrollbar",
        config = function()
            require "neva.plugins.scrollbar"
        end,
    }

    use {
        "folke/zen-mode.nvim",
        requires = "folke/twilight.nvim",
        config = function()
            require "neva.plugins.zen"
        end,
        cmd = "ZenMode",
    }

    -- TODO: make it lazy
    use {
        "mickael-menu/zk-nvim",
        config = function()
            require "neva.plugins.zk-nvim"
        end,
    }

    -- TODO: Maybe Try this again at some point
    -- use {
    --     "TimUntersberger/neogit",
    --     requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    --     cmd = "Neogit",
    --     config = function()
    --         require "neva.plugins.neogit"
    --     end,
    -- }

    -- TODO: This has to be configured maybe? Maybe use it?
    -- use {
    --     "kevinhwang91/nvim-bqf",
    -- }

    -- use {
    --     "ThePrimeagen/git-worktree.nvim",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     config = function()
    --         require "neva.git-worktree"
    --     end,
    -- }

    -- TODO: Integrate https://www.reddit.com/r/neovim/comments/rz4yxj/using_neovim_and_lua_as_a_wordprocessor/
    -- * https://github.com/rhysd/vim-grammarous
    -- * https://github.com/vigoux/LanguageTool.nvim
    -- * https://github.com/emacs-grammarly/lsp-grammarly
    -- * https://github.com/brymer-meneses/grammar-guard.nvim
    -- * https://github.com/valentjn/ltex-ls
    -- ** https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#vale
    -- https://docs.errata.ai/vale/about
    -- ** https://github.com/btford/write-good -- null_ls.builtins.diagnostics.write_good,
    -- ** https://www.nongnu.org/chktex/ -- null_ls.builtins.diagnostics.chktex
    --
end)
