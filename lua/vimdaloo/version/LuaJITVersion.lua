local oo = require('vimdaloo')
local SemanticVersion = oo.import('vimdaloo.version.SemanticVersion')

---
-- @class vimdaloo.version.LuaJITVersion
-- @inherits vimdaloo.version.SemanticVersion
--
-- [https://luajit.org/ext_jit.html](https://luajit.org/ext_jit.html)
--
local LuaJITVersion = oo.singleton(SemanticVersion:subclass('vimdaloo.version.LuaJITVersion'))

--- constructor
-- @display LuaJITVersion
-- @treturn vimdaloo.version.LuaJITVersion
function LuaJITVersion:initialize()
    SemanticVersion.initialize(self, jit.version:gsub('LuaJIT ', ''))
end

return LuaJITVersion
