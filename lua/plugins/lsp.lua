return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Setup language servers.
    local lspconfig = require('lspconfig')
    local configs = require('lspconfig.configs')

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
        },
      },
    }

    lspconfig.pyright.setup {}

    lspconfig.clangd.setup {}

    lspconfig.jsonls.setup {}

    lspconfig.vuels.setup {}

    lspconfig.glsl_analyzer.setup {}

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    configs.cspell = {
      default_config = {
        cmd = { 'cspell', '--stdio' },
        filetypes = { 'rust' },
        name = 'cspell',
        root_dir = lspconfig.util.root_pattern('.git', 'Makefile', 'package.json'),
      }
    }

    lspconfig.cspell.setup {}

    lspconfig.cssls.setup {
      capabilities = capabilities
    }
    vim.fn.sign_define(
      "DiagnosticSignError",
      { text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" }
    )
    vim.fn.sign_define(
      "DiagnosticSignHint",
      { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" }
    )
    vim.fn.sign_define(
      "DiagnosticSignInfo",
      { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" }
    )
    vim.fn.sign_define(
      "DiagnosticSignWarn",
      { text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }
    )

    vim.diagnostic.config({
      virtual_text = {
        source = false,
        prefix = "",
        format = function(diagnostic)
          local sign = ""

          if diagnostic.severity == vim.diagnostic.severity.ERROR then
            sign = vim.fn.sign_getdefined("DiagnosticSignError")[1].text
          elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            sign = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text
          elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            sign = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text
          elseif diagnostic.severity == vim.diagnostic.severity.HINT then
            sign = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text
          end

          return string.format("%s%s: %s ", sign, diagnostic.source or "", diagnostic.message)
        end,
      },
      float = {
        source = false,
        border = "single",
        header = false,
        format = function(diagnostic)
          return string.format("%s: %s ", diagnostic.source or "", diagnostic.message)
        end,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gd', ":Telescope lsp_definitions<cr>", opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gr', ':Telescope lsp_references<cr>')
        vim.keymap.set('n', '<leader>lf', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end
}
