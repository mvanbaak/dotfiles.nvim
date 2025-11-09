-- ================================================================================================
-- TITLE : NeoVim Configuration
-- ABOUT : Entrypoint of neovim configuration in lua
-- ================================================================================================

-- load some globals as very firt step
require("config.globals")
-- We use lazy.vim, and their documentation
-- suggest to require config.lazy and require/setup
-- the rest of the config from there. The above
-- config.globals is already against their documentation,
-- but me does me, so I have that anyways.
require("config.lazy")
