-- Some general configurations, which are used troughout the config

local config = {
    border = "rounded",
    lsp = {
        servers = {
            clangd = {
                format = false,
            },
            cmake = {
                format = false,
            },
            sumneko_lua = {
                format = false,
            },
            texlab = {
                format = false,
            },
            pylsp = {
                format = false,
            },
        },
    },
}

function config.lsp.can_client_format(client_name)
    local user_servers = vim.tbl_keys(config.lsp.servers)

    if config.lsp.servers[client_name] == true then
        return true
    end

    if vim.tbl_contains(user_servers, client_name) and config.lsp.servers[client_name] then
        return (config.lsp.servers[client_name].format == true)
    end

    return false
end

return config
