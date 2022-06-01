--- The vimdaloo root module.
--
-- @module vimdaloo

local M = {
    _VERSION = 'Vimdaloo 0.0.1-1',
    _DESCRIPTION = 'Object-Oriented Lua Library for Neovim',
    _URL = 'https://vimdaloo.io',
    _LICENSE = 'Apache License 2.0',
}

---
-- @display class
-- @tparam string name the name of the middleclass to create
-- @treturn function the created a middleclass
M.class = function(...)
    return require('middleclass')(...)
end

---
-- @display import
-- @tparam string name the name of the middleclass to import
-- @treturn function the imported middleclass
M.import = function(name)
    return require(name)
end

---
-- @display singleton
-- @tparam middleclass class the class to turn into a singleton
-- @treturn function the class turned into a singleton
M.singleton = function(class)
    if class.static._new == nil then
        class.static._new = class.static.new
        class.static.new = function()
            error('Use ' .. class.name .. ':instance() instead of :new()')
        end
        function class.static.instance(...)
            if class.static._singleton == nil then
                ---@diagnostic disable-next-line: redundant-parameter
                class.static._singleton = class.static._new(...)
            end
            return class.static._singleton
        end
    end
    return class
end

return M
