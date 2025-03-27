return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    
    -- Basic setup
    ls.setup({
      history = true,
      enable_autosnippets = true,
      update_events = "TextChanged,TextChangedI",
    })
    
    -- Get the Neovim config directory path
    local config_dir = vim.fn.stdpath('config')
    
    -- Load snippet modules with dofile instead of require
    local general_snippets = dofile(config_dir .. '/snippets/latex_general.lua')
    local number_theory_snippets = dofile(config_dir .. '/snippets/latex_number_theory.lua')
    
    -- Combine all snippet tables for LaTeX
    ls.add_snippets("tex", general_snippets)
    ls.add_snippets("tex", number_theory_snippets)
    
    -- Simple keymappings
    vim.keymap.set({"i", "s"}, "<C-j>", function()
      if ls.jumpable(1) then ls.jump(1) end
    end)
    
    vim.keymap.set({"i", "s"}, "<C-k>", function()
      if ls.jumpable(-1) then ls.jump(-1) end
    end)
    
    vim.keymap.set({"i"}, "<C-l>", function()
      if ls.expandable() then ls.expand() end
    end)
  end
}
