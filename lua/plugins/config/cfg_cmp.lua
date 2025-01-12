local M = {}

local cmp = require('cmp')
local cmp_kinds = require("ui.kinds").kind

M.snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
}

M.window = {
  completion = cmp.config.window.bordered({
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None"
  }),
  documentation = cmp.config.window.bordered({
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None"
  }),
}

M.mapping = {
  ['<C-d>'] = cmp.mapping.scroll_docs( -4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ["<C-p>"] = cmp.mapping.select_prev_item(),
  ["<C-n>"] = cmp.mapping.select_next_item(),
  ['<C-e>'] = cmp.mapping.close(),
  ['<CR>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
}

M.experimental = {
  ghost_text = true,
}

M.sources = {
  { name = 'luasnip',   keyword_length = 2, max_item_count = 2},
  { name = 'path',      keyword_length = 2 },
  { name = 'nvim_lsp',  keyword_length = 3, max_item_count = 5},
  { name = 'buffer',    keyword_length = 6 },
  { name = 'neorg'},
}

M.formatting = {
  format = function(_, vim_item)
    vim_item.abbr = string.sub(vim_item.abbr:gsub("^%W+", ""), 1, 35)
    vim_item.kind = " " .. string.format(" %s %s", cmp_kinds[vim_item.kind], string.sub(vim_item.kind, 1, 4))
    return vim_item
  end,
}

return M
