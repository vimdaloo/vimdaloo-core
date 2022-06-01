--- The vimdaloo root module.
--
-- @module vimdaloo

local M = {}

---
-- @display class
-- @tparam string name the name of the middleclass to create
-- @treturn function the created middleclass
M.class = require('middleclass') -- TODO: wrap this in a function

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
-- @treturn function the middleclass turned into a singleton
M.singleton = function(class)
    -- FIXME: figure out why the singleton mixin breaks Lua, but not LuaJIT or NVIM (which uses LuaJIT)
    if jit then
        return class:include(require('middleclass.mixin.singleton'))
    else
        -- HACK: setting instance function to new function
        class.instance = class.new
        return class
    end
end

return M
