local luasnip = require "luasnip"

local types = require "luasnip.util.types"

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " <- Current Choice", "NonTest" } },
            },
        },
    },
}

-- inspiered by from https://github.com/tjdevries/config_manager/blob/1cbcb01f7a0a689dd93a0ffe57e530331f0679c2/xdg_config/nvim/after/plugin/luasnip.lua#L326

-- <c-j> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, {
    silent = true,
})

-- <c-k> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, {
    silent = true,
})

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

vim.keymap.set("n", "<leader>sn", "<cmd>source ~/.config/nvim/lua/neva/plugins/luasnip/init.lua<CR>")

-- Load snippet form files
snippet_path = get_path(vim.env.MYVIMRC) .. "snippets"
require("luasnip.loaders.from_lua").load { paths = snippet_path }
