local lspconfig = require('lspconfig')
lspconfig.clangd.setup{
  cmd = { 'clangd', '--compile-commands-dir=build'},
  filetypes = { 'c', 'cpp' },
  root_dir = function() return vim.fn.getcwd() end,
  on_attach = function(client, bufnr)
    -- Set compiler flags
    vim.api.nvim_buf_set_option(bufnr, 'makeprg', 'clang\\ -Wall\\ -Wextra\\ -O3\\ %')
    vim.api.nvim_buf_set_option(bufnr, 'errorformat', '%f:%l:%c:\\ %tarning:\\ %m,%f:%l:%c:\\ %trror:\\ %m')
    end,
}

lspconfig.cmake.setup{}
--lspconfig.texlab.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.tsserver.setup{}
lspconfig.rnix.setup{}
lspconfig.gopls.setup{}
lspconfig.html.setup{}
lspconfig.cssls.setup{}
lspconfig.biome.setup{}
lspconfig.dockerls.setup{}
lspconfig.docker_compose_language_service.setup{}
--lspconfig.pylsp.setup{}

