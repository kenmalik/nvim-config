local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("all", {
    s("ternary", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    }),
    s("t", {
        c(1, { t("choice 1"), t("choice 2") })
    })
})

ls.add_snippets("lua", {
    s("f", {
        t("local "), i(1), t(" = function("), i(2), t({ ")", "  " }), i(0), t({ "", "end" })
    }),
    s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
    s("s", {
        t("s(\""), i(1), t({ "\", {", "    " }), i(2), t({ "", "})," })
    }),
})

ls.add_snippets("cmake", {
    s("cc", {
        t({ [[set(CMAKE_EXPORT_COMPILE_COMMANDS ON)]], [[file(CREATE_LINK ${CMAKE_BINARY_DIR}/compile_commands.json]],
            [[     ${CMAKE_SOURCE_DIR}/compile_commands.json SYMBOLIC)]] }),
    }),
})
