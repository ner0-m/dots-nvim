return {
    "nvim-orgmode/orgmode",
    config = function()
        -- Load custom tree-sitter grammar for org filetype
        require("orgmode").setup_ts_grammar()

        -- Checkout https://github.com/kristijanhusak/neovim-config/blob/master/nvim/lua/partials/orgmode_config.lua
        -- https://www.youtube.com/watch?v=nsv33iOnH34
        require("orgmode").setup {
            org_agenda_files = "~/src/work/notes/*",
            org_default_notes_file = "~/src/work/notes/refile.org",

            org_agenda_start_on_weekday = 1,
            org_todo_keywords = { "TODO(t)", "PROGRESS(p)", "|", "DONE(d)", "REJECTED(r)" },
            org_capture_templates = {
                t = {
                    description = "Refile",
                    template = "* TODO %?\n  DEADLINE: %T",
                },
                T = {
                    description = "Todo",
                    template = "* TODO %?\n  DEADLINE: %T",
                    target = "~/src/work/notes/todos.org",
                },
                r = {
                    description = "Reading",
                    template = "* TODO %? :learning:reading:\n",
                    target = "~/src/work/notes/todos.org",
                },
                p = {
                    description = "Project",
                    template = "* TODO %? :learning:project:\n",
                    target = "~/src/work/notes/todos.org",
                },
                w = {
                    description = "Work todo",
                    template = "* TODO %? :work:\n  DEADLINE: %t",
                    target = "~/src/work/notes/work.org",
                },
                e = {
                    description = "elsa todo",
                    template = "* TODO %? :work:elsa:\n  DEADLINE: %t",
                    target = "~/src/work/notes/work.org",
                },
                d = {
                    description = "Daily",
                    template = "* Daily %U \n  %?",
                    target = "~/src/work/notes/work.org",
                    headline = "Meetings",
                },
            },
        }
    end,
}
