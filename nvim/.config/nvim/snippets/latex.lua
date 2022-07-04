return {
    -- s("fmt4", fmt("foo() { return []; }", i(1, "x"), { delimiters = "[]" })),
    s("mathbb", fmta("\\mathbb{<>}", i(1))),
    -- s({ trig = "(%u)", regTrig = true }, fmta("\\<>{<>}", c(1, { t "mathbb", t "mathcal" }), t "placeholder")),
    s(
        { trig = "(%u)", regTrig = true },
        fmta("\\<>{<>}", {
            c(1, { t "mathbb",  t "mathcal", t "mathscr" }),
            f(function(_, snip)
                return snip.snippet.trigger
            end),
        })
    ),
    s(
        "norm",
        fmta("\\norm{<>}<><>", {
            i(1),
            c(2, {
                t "",
                sn(nil, fmta("_{<>}", { i(1) })),
            }),
            c(3, {
                t "",
                sn(nil, fmta("^{<>}", { i(1) })),
            }),
        })
    ),
    s("eq", fmta("\\[ <> \\]", i(1))),
    s("begin", fmta("\\begin{<>}\n\t<>\n\\end{<>}", { i(1), i(2), rep(1) })),
}

--[[
snippets.tex = make {

    bm = {
        snippet = single_wrap "bm",
        name = "Bold math",
        desc = { "## Access bold symbols in maths mode", "", "Note: Requires \\usepackage{bm} to work" },
    },

    ["vs(%a)"] = {
        snippet = f(function(_, snip)
            return "\\bm{" .. string.upper(snip.captures[1]) .. "}"
        end, {}),
        name = "Single character vector spaces",
        regTrig = true,
    },

    ["vsm(%a)"] = {
        snippet = f(function(_, snip)
            return "$\\bm{" .. string.upper(snip.captures[1]) .. "}$"
        end, {}),
        name = "Single character vector spaces with math surrounding",
        regTrig = true,
    },

    ["mbb(%a)"] = {
        snippet = f(function(_, snip)
            return "\\mathbb{" .. string.upper(snip.captures[1]) .. "}"
        end, {}),
        name = "Blackboard bold for single characters",
        regTrig = true,
    },

    norm = {
        snippet = {
            t { "\\norm{" },
            i(1),
            t { "}" },
            opt_subscript(2),
            opt_superscript(3),
            i(0),
        },
        name = "norm",
    },

    normp = {
        snippet = {
            t { "\\norm{" },
            i(1),
            t { "}_p" },
            i(0),
        },
        name = "norm",
    },

    normq = {
        snippet = {
            t { "\\norm{" },
            i(1),
            t { "}_q" },
            i(0),
        },
        name = "norm",
    },

    norminf = {
        snippet = {
            t { "\\norm{" },
            i(1),
            t { "}_{\\infty}" },
            i(0),
        },
        name = "norm",
    },
    innerproduct_dots = {
        snippet = {
            t { "\\langle \\cdot, \\cdot \\rangle" },
            i(0),
        },
        name = "Snippet for inner product with cdots in the middle",
    },

    innerproduct = {
        snippet = {
            t { "\\langle " },
            i(1),
            t { ", " },
            i(2),
            t { "\\rangle" },
            i(0),
        },
        name = "Snippet for inner product",
    },

    seqxj = {
        snippet = {
            t { "(x_{j})_{j \\in \\mathbb{N}}" },
            i(0),
        },
        name = "Sequence of x_j for j in natural numbers",
    },

    seqxn = {
        snippet = {
            t { "(x_{n})_{n \\in \\mathbb{N}}" },
            i(0),
        },
        name = "Sequence of x_n for n in natural numbers",
    },

    seqn = {
        snippet = {
            t { "(" },
            i(1),
            t { "_{n})_{n \\in \\mathbb{N}}" },
            i(0),
        },
        name = "Sequence for n in natural numbers",
    },

    eq = {
        snippet = {
            t { "\\[ " },
            i(1),
            t { " \\] " },
            i(0),
        },
        name = "Math equation environment",
    },

    set = {
        snippet = {
            t { "\\{ " },
            i(1),
            t { " \\} " },
            i(0),
        },
        name = "Set environment",
    },

    ["$"] = {
        snippet = {
            t { "$" },
            i(1),
            t { "$" },
            i(0),
        },
        name = "inline math",
    },

    ["!="] = {
        snippet = {
            t { "\\neq" },
            i(0),
        },
        name = "Not equal to",
    },

    [":="] = {
        snippet = {
            t { "\\coloneqq" },
            i(0),
        },
        name = "Defined as",
    },

    ["<="] = {
        snippet = {
            t { "\\leq" },
            i(0),
        },
        name = "Less than or equal to",
    },

    [">="] = {
        snippet = {
            t { "\\geq" },
            i(0),
        },
        name = "Greater than or equal to",
    },

    ellp = {
        snippet = {
            t { "\\ell^p" },
            i(0),
        },
        name = "\\ell^p space",
    },

    Ellp = {
        snippet = {
            t { "\\Ell^p" },
            i(0),
        },
        name = "\\Ell^p space",
    },

    pair = {
        snippet = {
            t { "(" },
            i(1),
            t { ", " },
            i(2),
            t { ")" },
            i(0),
        },
        name = "Pair of tings in parenthesis",
    },

    vspair = {
        snippet = {
            t { "(\\bm{X}, " },
            i(1),
            t { ")" },
            i(0),
        },
        name = "Pair of vector space and something else",
    },

    vspair_ell = {
        snippet = {
            t { "(\\ell^p, \\norm{\\cdot}_p)" },
            i(0),
        },
        name = "Pair of \\ell^p space and p-norm",
    },

    vspair_Ell = {
        snippet = {
            t { "(\\Ell^p, \\norm{\\cdot}_p)" },
            i(0),
        },
        name = "Pair of \\Ell^p space and p-norm",
    },

    begin = {
        snippet = fmt("\\begin{{{}}}\n\t{}\n\\end{{{}}}", { i(1), i(2), rep(1) }),
        name = "Begin end pair",
    },

    def = special_begin "definition",
    lem = special_begin "lemma",
    theo = special_begin "theorem",
    coro = special_begin "corollary",

    sum_ntoinf = {
        snippet = {
            t { "\\sum_{n=1}^{\\infty}" },
            i(0),
        },
        name = "Sum of n to plus infinity",
    },

    sum_jton = {
        snippet = {
            t { "\\sum_{j=1}^{n}" },
            i(0),
        },
        name = "Sum of j to n",
    },
    frac = {
        snippet = {
            t { "\\frac{" },
            i(1),
            t { "}{" },
            i(2),
            t { "}" },
            i(0),
        },
    },
    oneover = {
        snippet = {
            t { "\\frac{1}{" },
            i(1),
            t { "}" },
            i(0),
        },
        name = "One over",
    },

    inf = {
        snippet = {
            t { "\\infty" },
            i(0),
        },
        name = "Infinity",
    },

    ["."] = {
        snippet = {
            t { "\\cdot" },
            i(0),
        },
        name = "Single middle dot as placeholder in math environments",
    },

    ["..."] = {
        snippet = {
            t { "\\dots" },
            i(0),
        },
        name = "Triple dots",
    },

    ["L("] = {
        snippet = {
            t { "L(" },
            i(1),
            t { ", " },
            i(2),
            t { ")" },
            i(0),
        },
        name = "Triple dots",
    },

    ["_"] = {
        snippet = {
            t { "_{" },
            i(1, "subscript"),
            t { "}" },
            i(0),
        },
        name = "Subscript",
    },

    ["^"] = {
        snippet = {
            t { "^{" },
            i(1, "supscript"),
            t { "}" },
            i(0),
        },
        name = "Supscript",
    },

    sup = {
        snippet = {
            t { "\\sup" },
            opt_subscript(1),
            i(0),
        },
        name = "Supremum",
    },

    lim = {
        snippet = {
            t { "\\lim" },
            opt_subscript(1),
            i(0),
        },
        name = "Limes",
    },

    snippets for:
    * forall x in X
    * abs
    * (n|j|i|k) \in \mathbb{N}
    * inverse of operator
    * item[i)]
    * choice for \ell space and \Ell space

}
    --]]
