local oo = require('vimdaloo')
local SemanticVersion = oo.import('vimdaloo.version.SemanticVersion')

---
-- @class vimdaloo.version.LuaVersion
-- @inherits vimdaloo.version.SemanticVersion
--
-- [https://www.lua.org/manual/5.4/manual.html#pdf-_VERSION](https://www.lua.org/manual/5.4/manual.html#pdf-_VERSION)
--
local LuaVersion = oo.singleton(SemanticVersion:subclass('vimdaloo.version.LuaVersion'))

--- constructor
-- @display LuaVersion
-- @treturn vimdaloo.version.LuaVersion
function LuaVersion:initialize()
    SemanticVersion.initialize(self, _VERSION:gsub('Lua ', ''))
end

return LuaVersion
