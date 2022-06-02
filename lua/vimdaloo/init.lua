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
-- @display class
-- @tparam string name the name of the middleclass to create
-- @treturn function the created middleclass
function M.class(...)
    return require('middleclass')(...)
end

---
-- @display import
-- @tparam string name the name of the middleclass to import
-- @treturn function the imported middleclass
function M.import(name)
    return require(name)
end

---
-- @display singleton
-- @tparam middleclass class the class to turn into a singleton
-- @treturn function the class turned into a singleton
function M.singleton(class)
    -- Had to write this code myself since the middleclass-mixin-singleton
    -- module works on Lua 5.1 and LuaJIT 2.1.0-beta3, but blows up on Lua 5.4.
    if class.static._new == nil then
        class.static._new = class.static.new
        class.static.new = function()
            error('Use ' .. class.name .. ':instance() instead of :new()')
        end
        function class.static.instance(...)
            if class.static._singleton == nil then
                class.static._singleton = class.static._new(...) ---@diagnostic disable-line: redundant-parameter
            end
            return class.static._singleton
        end
    end
    return class
end

if vim then
    --- Only available within `nvim`, adding commands `:VimdalooVersionNotify` and `:VimdalooVersionPrint`
    -- @display setup
    -- @tparam table user_config optional custom user configuration
    function M.setup(user_config) ---@diagnostic disable-line: unused-local
        vim.cmd([[command! VimdalooVersionNotify :lua require('vimdaloo.version').notify()<CR>]])
        vim.cmd([[command! VimdalooVersionPrint :lua require('vimdaloo.version').print()<CR>]])
    end
end

return M
