local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("if", {
		t("if "),
		i(1, "condition"),
		t({ " do", "\t" }),
		i(2, "body"),
		t({ "", "end" }),
	}),
}
