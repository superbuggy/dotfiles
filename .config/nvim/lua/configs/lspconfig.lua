-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"
-- local registry = require "mason-registry"

local installed_lsp_servers = { "html", "cssls", "eslint", "ts_ls", "rescriptls", "emmet_language_server", "lua_ls", "pylsp", "volar" }

-- This loop seems to break renaming and possibly some other features of NVChad,
-- possibly when .lspconfig field is not a string but a function?
-- for _, pkg in ipairs(registry.get_installed_packages()) do
--   -- Check if the package is in the "LSP" category
--   if pkg.spec.neovim and pkg.spec.neovim.lspconfig then
--     local cfgname = pkg.spec.neovim.lspconfig
--     if cfgname == "vue_ls" then
--       cfgname = "volar" -- this sucks
--     end
--     table.insert(installed_lsp_servers, cfgname)
--   end
-- end
-- print(vim.inspect(installed_lsp_servers))
for _, lsp in ipairs(installed_lsp_servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

