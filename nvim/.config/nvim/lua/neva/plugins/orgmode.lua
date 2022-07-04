-- Load custom tree-sitter grammar for org filetype
require("orgmode").setup_ts_grammar()

-- Checkout https://github.com/kristijanhusak/neovim-config/blob/master/nvim/lua/partials/orgmode_config.lua
-- https://www.youtube.com/watch?v=nsv33iOnH34
require("orgmode").setup {
    org_agenda_files = "~/src/notes/org/**/*",
    org_default_notes_file = "~/src/notes/org/refile.org",
    org_agenda_start_on_weekday = false,
    org_todo_keywords = { "TODO(t)", "PROGRESS(p)", "|", "DONE(d)", "REJECTED(r)" },
    org_capture_templates = {
        t = {
            description = "Refile",
            template = "* TODO %?\n  DEADLINE: %T",
        },
        T = {
            description = "Todo",
            template = "* TODO %?\n  DEADLINE: %T",
            target = "~/src/notes/org/todos.org",
        },
        w = {
            description = "Work todo",
            template = "* TODO %?\n  DEADLINE: %T",
            target = "~/src/notes/org/work.org",
        },
        d = {
            description = "Daily",
            template = "* Daily %U \n  %?",
            target = "~/src/notes/org/work.org",
            headline = "Meetings",
        },
    },
}
