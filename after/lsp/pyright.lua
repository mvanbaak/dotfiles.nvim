-- ================================================================================================
-- TITLE : pyright
-- ABOUT : Static Type Checker for Python
--         This is in after/lsp because nvim-lspconfig overrides the on_attach
-- LINKS :
--   > github : https://github.com/microsoft/pyright
-- ================================================================================================

-- Try to detect and set a local python interpreter for a root path
local function find_python_interpreter(root_dir)
    local search_dir = root_dir or vim.fn.getcwd()

    -- uv project
    if vim.fn.filereadable(search_dir .. "/pyproject.toml") == 1 then
        local handle = io.popen("cd " .. search_dir .. " && uv python find 2>/dev/null")
        if handle then
            local result = handle:read("*a")
            handle:close()
            if result and result ~= "" then
                return vim.trim(result)
            end
        end
    end

    -- .venv directory
    local venv_python = search_dir .. "/.venv/bin/python"
    if vim.fn.executable(venv_python) == 1 then
        return venv_python
    end

end

local function on_attach(client, _)
    local python_path = find_python_interpreter(client.config.root_dir) or "python"
    client.config.settings.python = client.config.settings.python or {}
    client.config.settings.python.pythonPath = python_path
    client:notify("workspace/didChangeConfiguration", { settings = client.config.settings })
end

return {
    on_attach = on_attach,
    settings = {
        python = {
            pythonPath = "python3",
        },
    },
}
