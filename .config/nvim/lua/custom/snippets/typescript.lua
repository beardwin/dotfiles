local ls = require("luasnip")
local s = ls.snippet
-- local t = ls.text_node
local i = ls.insert_node

return {
  -- jest
  s(
    "desc",
    fmt(
      [[
  describe('{}', () => {{
    {}
  }})
  ]],
      { i(1), i(2) }
    )
  ),
  s(
    "it",
    fmt(
      [[
    it('{}', {}() => {{
      {}
    }})
  ]],
      { i(1), i(2), i(3) }
    )
  ),
}
