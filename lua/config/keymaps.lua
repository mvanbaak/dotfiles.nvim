-- ================================================================================================
-- TITLE : keymaps
-- ABOUT : keymaps / shortcuts
-- ================================================================================================

-- Helper functions to set keymaps with some defaults
local nmap = function(key, effect, description)
    desc = description or ""
    vim.keymap.set("n", key, effect, { silent = true, noremap = true, desc = desc })
end

local vmap = function(key, effect, description)
    desc = description or ""
    vim.keymap.set("v", key, effect, { silent = true, noremap = true, desc = desc })
end

local imap = function(key, effect, description)
    desc = description or ""
    vim.keymap.set("i", key, effect, { silent = true, noremap = true, desc = desc })
end


-- Better indenting in visual mode
vmap("<", "<gv", "Indent left and reselect")
vmap(">", ">gv", "Indent right and reselect")

-- Splitting & Resizing
nmap("<leader>sv", "<Cmd>vsplit<CR>", "Split window vertically")
nmap("<leader>sh", "<Cmd>split<CR>", "Split window horizontally")
nmap("<C-Up>", "<Cmd>resize +2<CR>", "Increase window height")
nmap("<C-Down>", "<Cmd>resize -2<CR>", "Decrease window height")
nmap("<C-Left>", "<Cmd>vertical resize -2<CR>", "Decrease window width")
nmap("<C-Right>", "<Cmd>vertical resize +2<CR>", "Increase window width")

-- Better J behavior
nmap("J", "mzJ`z", "Join lines and keep cursor position")
