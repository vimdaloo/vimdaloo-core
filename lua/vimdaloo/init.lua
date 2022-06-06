--- The root vimdaloo module.
--
-- @module vimdaloo

local M = {
    _VERSION = 'Vimdaloo 0.0.1-1',
    _DESCRIPTION = 'Object-Oriented Lua Library for Neovim',
    _URL = 'https://github.com/vimdaloo/vimdaloo-core',
    _LICENSE = 'Apache License 2.0',
}

--- Setup.
-- Required to bootstrap the system
-- @section Setup
--
-- @code
--    -- accept the defaults
--    require('vimdaloo').setup()
--
--    -- or override the defaults
--    require('vimdaloo').setup({
--        env = _G,
--        base_path = vim and 'lua' or 'src',
--    })

--- API.
--- @section API

--- bootstraps the vimdaloo system
-- @display setup
-- @tparam table config optional custom user configuration
function M.setup(config)
    -- initialize the language
    require('vimdaloo.lang').setup(config)
    -- if in vim, add commands
    if vim then
        vim.cmd [[command! VimdalooVersionNotify :lua require('vimdaloo.version').notify()<CR>]]
        vim.cmd [[command! VimdalooVersionPrint :lua require('vimdaloo.version').print()<CR>]]
    end
end

return M
