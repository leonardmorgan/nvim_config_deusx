local M = {}

local lsp_handlers = require('plugins.config.lsp.lsp_handlers')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local notify = require('notify')


-- autocompletion
M.capabilities = cmp_nvim_lsp.default_capabilities()

-- configuration on attach
M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  lsp_handlers.set_lsp_signature(client, bufnr)
  lsp_handlers.set_navic(client, bufnr)
end

M.on_init = function(client)
  -- notify the lsp started
  local m = "[" .. client.name .. "] client server has started successfully!";
  vim.notify(m, nil, { title = " LSP"})
  -- notify(m, nil, { title = " LSP"})
end

M.flags = { debounce_text_changes = 150 }

return M
