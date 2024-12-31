local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("handlerFn", {
    t("func "),
    i(1),
    t("(w http.ResponseWriter, r *http.Request) {"),
    i(2),
    t("}"),
  }),
}
