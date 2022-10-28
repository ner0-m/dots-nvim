require("neorg").setup {
    -- Tell Neorg what modules to load
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.norg.concealer"] = {}, -- Allows for use of icons
        ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
                workspaces = {
                    gtd = "~/src/work/notes/gtd",
                },
                index = "inbox.norg",
            },
        },
        ["core.gtd.base"] = {
            config = {
                workspace = "gtd",
            },
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
            },
        },
        ["core.keybinds"] = { -- Configure core.keybinds
            config = {
                default_keybinds = true, -- Generate the default keybinds
                neorg_leader = "<Leader>o", -- This is the default if unspecified
            },
        },
        ["core.integrations.telescope"] = {}, -- Enable the telescope module
        ["core.norg.qol.toc"] = {},
    },
}
