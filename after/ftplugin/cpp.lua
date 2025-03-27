vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.colorcolumn = "80"
vim.opt_local.commentstring = "// %s"

vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.foldenable = true
vim.opt_local.foldlevel = 99

vim.opt_local.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

-- Open fold with l
vim.keymap.set("n", "l", function()
  if vim.fn.foldclosed(vim.fn.line(".")) ~= -1 then
    return "zo"
  else
    return "l"
  end
end, {buffer = true, expr = true})

-- Close fold with h
vim.keymap.set("n", "h", function()
  if vim.fn.foldlevel(vim.fn.line(".")) > 0 then
    return "zc"
  else
    return "h"
  end
end, { buffer = true, expr = true })

vim.keymap.set("n", "zR", ":set foldlevel=99<CR>", { buffer = true, silent = true })  -- Open all folds
vim.keymap.set("n", "zM", ":set foldlevel=0<CR>", { buffer = true, silent = true })   -- Close all folds
vim.keymap.set("n", "<CR>", "za", { buffer = true, silent = true })  -- Toggle fold with space

-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = true})

-- Go to declaration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = true})

-- Go to implementation
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = true})

-- Go to type definition
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = true})

-- List all references
vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = true})

-- Show hover information
vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = true})

-- Enhanced definition navigation with Telescope
vim.keymap.set("n", "<leader>fd", ":Telescope lsp_definitions<CR>", {buffer = true})
vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>", {buffer = true})
vim.keymap.set("n", "<leader>fi", ":Telescope lsp_implementations<CR>", {buffer = true})
vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", {buffer = true})

-- Snippets for C++
require("nvim-surround").buffer_setup({
  surrounds = {
    ["f"] = {
      add = function ()
        local fname = require("nvim-surround.config").get_input("Function name: ")
        return { { fname .. "(" }, { ")" } }
      end,
    },
    ["i"] = {
      add = { "#include <", ">" },
    },
    ["I"] = {
      add = { '#include "', '"' },
    },
  },
})


vim.keymap.set("n", "<F5>", ":w<CR>:terminal g++ -std=c++17 % -o %:r && ./%:r<CR>", { buffer = true, silent = true })
vim.keymap.set("n", "<F6>", ":w<CR>:terminal g++ -std=c++17 -g % -o %:r<CR>", { buffer = true, silent = true })
