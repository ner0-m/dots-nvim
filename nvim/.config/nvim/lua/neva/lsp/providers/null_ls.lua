local null_ls = require "null-ls"

require("null-ls").setup {
    sources = {
        -- Formatters
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.formatting.codespell.with {
            extra_args = {
                "-I",
                get_path(vim.env.MYVIMRC) .. "spell/en.utf-8.add",
            },
        },

        null_ls.builtins.formatting.black,

        -- Latex formatter and linter
        null_ls.builtins.formatting.latexindent,
        null_ls.builtins.diagnostics.chktex,

        -- Diagnostics
        null_ls.builtins.diagnostics.misspell,
        null_ls.builtins.diagnostics.codespell.with {
            extra_args = {
                "-I",
                get_path(vim.env.MYVIMRC) .. "spell/en.utf-8.add",
            },
        },

        -- Code actions
        null_ls.builtins.code_actions.gitsigns,

        -- Remove trailing whitespaces
        null_ls.builtins.formatting.trim_newlines,
        null_ls.builtins.formatting.trim_whitespace,

        null_ls.builtins.diagnostics.gccdiag,
    },

    on_attach = function(_, bufnr)
        require("neva.lsp.mappings").format(bufnr)
    end,
}
