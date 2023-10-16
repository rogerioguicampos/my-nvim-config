local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'gopls',
    'pyright',
    'sqlls',
    'clangd',
    'rust_analyzer',
    'tsserver',
    'jsonls',
    'html',
    'cssls',
    'yamlls',
  }
})

require('lspconfig').lua_ls.setup {
  on_attach = on_attach
}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'python' }
}

require('lspconfig').gopls.setup({
  on_attach = on_attach,
  cmd = {'gopls'},
  filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
  setting = {
    gopls = {
      completeUnimported = true,
      usePlaceHolders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

require('lspconfig').tsserver.setup({
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'ejs' },
  cmd = { 'typescript-language-server', '--stdio' },
  capabilities = capabilities
})
