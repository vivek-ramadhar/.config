vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.fn.has('wsl') == 1 then
    vim.g.WSL = true
end

require("neotex.core")
require("neotex.bootstrap")
