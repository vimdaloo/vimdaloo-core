--- The root vimdaloo module.
--
-- @module vimdaloo

local M = {
    _VERSION = 'Vimdaloo 0.0.1-1',
    _DESCRIPTION = 'Object-Oriented Lua Library for Neovim',
    _URL = 'https://github.com/vimdaloo/vimdaloo-core',
    _LICENSE = 'Apache License 2.0',
}

---
-- @display setup
-- @tparam table config optional custom user configuration
function M.setup(config)
    require('vimdaloo.lang').setup(config)
    -- if in vim, add commands
    if vim then
        vim.cmd [[command! VimdalooVersionNotify :lua require('vimdaloo.version').notify()<CR>]]
        vim.cmd [[command! VimdalooVersionPrint :lua require('vimdaloo.version').print()<CR>]]
    end
end

return M
