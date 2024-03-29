local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' } }) })

  -- Set up lspconfig.

 mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    })
--lspconfig setup
lspconfig.clangd.setup {
    capabilities = capabilities,
      cmd = { 'clangd', '--compile-commands-dir=build'},
      filetypes = { 'c', 'cpp' },
      root_dir = function() return vim.fn.getcwd() end,
      on_attach = function(client, bufnr)
        -- Set compiler flags
        vim.api.nvim_buf_set_option(bufnr, 'makeprg', 'clang\\ -Wall\\ -Wextra\\ -O3\\ %')
        vim.api.nvim_buf_set_option(bufnr, 'errorformat', '%f:%l:%c:\\ %tarning:\\ %m,%f:%l:%c:\\ %trror:\\ %m')
        end,
}
lspconfig.sqlls.setup {
    capabilities = capabilities,
    root_dir = function() return vim.fn.getcwd() end,
}
lspconfig.texlab.setup {
    capabilities = capabilities
}
lspconfig.lua_ls.setup {
    capabilities = capabilities
}
lspconfig.pylsp.setup {
    capabilities = capabilities
}
lspconfig.gopls.setup {
    capabilities = capabilities
}
lspconfig.rnix.setup {
    capabilities = capabilities
}
lspconfig.html.setup {
    capabilities = capabilities
}
lspconfig.biome.setup {
    capabilities = capabilities
}
lspconfig.tsserver.setup{
    capabilities = capabilities
}
lspconfig.cssls.setup {
    capabilities = capabilities
}
lspconfig.tailwindcss.setup{
    capabilities = capabilities
}
lspconfig.volar.setup{
    capabilities = capabilities
}
lspconfig.jsonls.setup {
    capabilities = capabilities
}
lspconfig.cmake.setup {
    capabilities = capabilities,
    cmd = { "/home/vebly/.local/share/nvim/mason/packages/cmake-language-server/venv/bin/cmake-language-server" },
}
lspconfig.docker_compose_language_service.setup{
    capabilities = capabilities
}
lspconfig.dockerls.setup{
    capabilities = capabilities
}
lspconfig.rust_analyzer.setup{
    capabilities = capabilities
}
lspconfig.arduino_language_server.setup{
    capabilities = capabilities,
    root_dir = function() return vim.fn.getcwd() end, }
