local ls = require "luasnip"
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require "luasnip.util.types"
local conds = require "luasnip.extras.expand_conditions"

return {
    s("pragma", t { "#pragma once" }),

    -- Multiple triggers are not supported yet https://github.com/L3MON4D3/LuaSnip/issues/420
    s("include", fmta("#include <>", c(1, { fmt('"{}"', i(1)), fmt("<{}>", i(1)) }))),
    s("include", fmta("#include <>", c(1, { fmt('"{}"', i(1)), fmt("<{}>", i(1)) }))),

    s("namespace", fmta("namespace <>\n{\n<>\n}", { i(1), i(2) })),

    s("/**", fmta("/**\n ) @brief <>\n*/", { i(1) })),

    s("class", fmta("class <> {\n<>\n};\n", { i(1), i(2) })),
    s("struct", fmta("struct <> {\n<>\n};\n", { i(1), i(2) })),
}
