local defaults = require "neva.lsp.providers.default"
local servers = require("neva.config").lsp.servers
local utils = require "neva.utils"

for server_name, _ in pairs(servers) do
    local my_config = require("neva.lsp.providers." .. server_name) -- Get my config
    local server_config = utils.merge(defaults, my_config) -- merge with defaults

    server = require("lspconfig")[server_name]
    server.setup(server_config)
end

-- null_ls is not callable like the others
require "neva.lsp.providers.null_ls"
