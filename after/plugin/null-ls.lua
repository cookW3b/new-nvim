local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      extra_args = {
        "--no-semi",
        "--single-quote",
      }
    }),
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.diagnostics.cspell.with({
      extra_args = {

      }
    }),
    null_ls.builtins.code_actions.cspell
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)

vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format()<cr>')

local prettier = require('prettier')

prettier.setup({
  cli_options = {
    bracket_spacing = true,
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    jsx_single_quote = true,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_quote = true,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
  },
})
