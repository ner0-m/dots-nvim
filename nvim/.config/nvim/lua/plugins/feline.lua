local colors = {
    background = "base",
    panel = "surface",
    border = "highlight_med",
    comment = "muted",
    link = "iris",
    punctuation = "muted",
    error = "love",
    hint = "iris",
    info = "foam",
    warn = "gold",
    git_add = "foam",
    git_change = "rose",
    git_delete = "love",
    git_dirty = "rose",
    git_ignore = "muted",
    git_merge = "iris",
    git_rename = "pine",
    git_stage = "iris",
    git_text = "rose",
    headings = {
        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },
}

return {
    "feline-nvim/feline.nvim",
    config = function()
        local vi_mode_utils = require "feline.providers.vi_mode"
        local navic = require "nvim-navic"

        -- Some highlights, used multiple times
        local default_hl = {
            fg = colors.rose,
            bg = colors.background,
        }

        local emphasized_hl = {
            fg = colors.rose,
            bg = colors.panel,
            style = "bold",
        }

        local emphasized_whitespace = {
            str = " ",
            hl = emphasized_hl,
        }

        local highlight_left_sep = {
            " ",
            "slant_left_2",
            " ",
            emphasized_whitespace,
        }

        local highlight_right_set = {
            emphasized_whitespace,
            "slant_right_2",
        }

        local comps = {
            -- A nice left border
            left_border = {
                provider = "▊ ",
                hl = default_hl,
            },
            -- Vi mode icon
            vi_mode = {
                provider = "vi_mode",
                hl = function()
                    return {
                        name = vi_mode_utils.get_mode_highlight_name(),
                        fg = vi_mode_utils.get_mode_color(),
                        bg = colors.bg,
                        style = "bold",
                    }
                end,
                right_sep = " ",
            },
            file = {
                -- File name
                info = {
                    provider = "file_info",
                    hl = emphasized_hl,
                    left_sep = highlight_left_sep,
                    right_sep = highlight_right_set,
                },
                -- Position in file
                position = {
                    provider = "position",
                    left_sep = " ",
                    right_sep = {
                        " ",
                        {
                            str = "slant_right_2_thin",
                            hl = default_hl,
                        },
                    },
                },
                -- Type of file
                type = {
                    provider = "file_type",
                    hl = emphasized_hl,
                    left_sep = highlight_left_sep,
                    right_sep = highlight_right_set,
                },
            },
            -- Diagnostics
            diagnos = {
                err = {
                    provider = "diagnostic_errors",
                    hl = { fg = colors.error },
                },
                warn = {
                    provider = "diagnostic_warnings",
                    hl = { fg = colors.warning },
                },
                hint = {
                    provider = "diagnostic_hints",
                    hl = { fg = colors.hint },
                },
                info = {
                    provider = "diagnostic_info",
                    hl = { fg = colors.info },
                },
            },
            git = {
                branch = {
                    provider = "git_branch",
                    hl = emphasized_hl,
                    left_sep = highlight_left_sep,
                    right_sep = highlight_right_set,
                },
                added = {
                    provider = "git_diff_added",
                    hl = {
                        fg = colors.gid_add,
                        bg = colors.background,
                    },
                },
                changed = {
                    provider = "git_diff_changed",
                    hl = {
                        fg = colors.git_change,
                        bg = colors.background,
                    },
                },
                removed = {
                    provider = "git_diff_removed",
                    hl = {
                        fg = colors.git_delete,
                        bg = colors.background,
                    },
                },
            },
            -- Percentage of line in buffer
            line_percentage = {
                provider = "line_percentage",
                hl = default_hl,
                left_sep = " ",
                right_sep = " ",
            },
            -- A nice scroll bar
            scroll_bar = {
                provider = "scroll_bar",
                hl = emphasized_hl,
            },
            -- info about location using treesitter
            position = {
                navic = {
                    provider = function()
                        return navic.get_location()
                    end,
                    left_sep = {
                        " ",
                        {
                            str = "slant_right_2_thin",
                            hl = default_hl,
                        },
                        " ",
                    },
                    hl = default_hl,
                    enabled = function()
                        return navic.is_available()
                    end,
                },
            },
        }

        local components = {
            active = {},
            inactive = {},
        }

        table.insert(components.active, {})
        table.insert(components.active, {})
        table.insert(components.inactive, {})

        table.insert(components.active[1], comps.left_border)
        table.insert(components.active[1], comps.vi_mode)
        table.insert(components.active[1], comps.file.info)
        table.insert(components.active[1], comps.position)
        table.insert(components.active[1], comps.diagnos.err)
        table.insert(components.active[1], comps.diagnos.warn)
        table.insert(components.active[1], comps.diagnos.hint)
        table.insert(components.active[1], comps.diagnos.info)
        table.insert(components.active[1], comps.position.navic)
        table.insert(components.active[2], comps.git.added)
        table.insert(components.active[2], comps.git.changed)
        table.insert(components.active[2], comps.git.removed)
        table.insert(components.active[2], comps.git.branch)
        table.insert(components.active[2], comps.line_percentage)
        table.insert(components.active[2], comps.scroll_bar)

        table.insert(components.inactive[1], comps.file.type)
        table.insert(components.inactive[1], {})

        require("feline").setup {
            components = components,
            -- vi_mode_colors = vi_mode_colors,
        }
    end,
}
