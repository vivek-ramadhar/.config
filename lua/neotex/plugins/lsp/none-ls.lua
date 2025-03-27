-- nvim/lua/neotex/plugins/lsp/none-ls.lua
return {
  "nvimtools/none-ls.nvim",
  lazy = true,
  ft = { "py", "html", "js", "ts", "lua", "cpp", "c" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    local mason_null_ls = require("mason-null-ls")
    mason_null_ls.setup({
      ensure_installed = {
        "stylua",      -- lua formatter
        "isort",       -- python formatter
        "black",       -- python formatter
        "pylint",      -- python linter
        "clang-format", -- C++ formatter
        "cppcheck",    -- C++ linter (more reliable than cpplint)
      },
      automatic_installation = true,
      handlers = {},
    })

    -- for conciseness
    local null_ls = require("null-ls")
    local null_ls_utils = require("null-ls.utils")
    local formatting = null_ls.builtins.formatting   -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- configure null_ls
    null_ls.setup({
      debug = true,
      log = {
        enable = true,
        level = "trace",
        use_console = false,
      },
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      sources = {
        -- Lua
        formatting.stylua.with({
          extra_args = {
            "--quote-style", "AutoPreferDouble",
            "--indent-type", "Spaces",
            "--indent-width", "2",
          },
        }),
        -- Python
        formatting.isort.with({
          extra_args = { "--profile", "black" },
        }),
        formatting.black.with({
          extra_args = { "--fast", "--line-length", "88" },
        }),
        diagnostics.pylint.with({
          extra_args = {
            "--output-format=text",
            "--msg-template={line}:{column}:{category}:{msg}",
            "--score=no",
          },
          diagnostics_format = "#{m} (#{c})",
        }),
        -- C/C++ tools
        formatting.clang_format,
        diagnostics.cppcheck,  -- Using cppcheck instead of cpplint
      },
    })
  end,
}
