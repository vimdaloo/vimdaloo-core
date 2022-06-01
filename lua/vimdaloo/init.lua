--- The vimdaloo root module.
--
-- @module vimdaloo

local M = {}

---
-- @display class
-- @tparam string name the name of the middleclass to create
-- @treturn middleclass the created middleclass
M.class = require('middleclass') -- TODO: wrap this in a function

---
-- @display import
-- @tparam string name the name of the middleclass to import
-- @treturn middleclass the imported middleclass
M.import = function(name)
    return require(name)
end

---
-- @display singleton
-- @tparam middleclass class the class to turn into a singleton
-- @treturn middleclass the middleclass turned into a singleton
M.singleton = function(class)
    return class:include(require('middleclass.mixin.singleton'))
end

return M
