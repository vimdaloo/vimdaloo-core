local import = require('vimdaloo').import
local Object = import('vimdaloo.lang.Object')

---
-- @class vimdaloo.version.Version
-- @display …version.Version
-- @inherits vimdaloo.lang.Object
--
-- **Subclasses**
--
-- @{vimdaloo.version.SemanticVersion|SemanticVersion}
local Version = Object:subclass('vimdaloo.version.Version')

--- Description.
-- A simple version prefix/value holder.
-- @section Description

--- API.
--- @section API

--- constructor
-- @display Version
-- @tparam string prefix
-- @tparam string value
-- @treturn vimdaloo.version.Version
function Version:initialize(prefix, value)
    Object.initialize(self)
    self.prefix = prefix
    self.value = value
end

--- prefix accessor
-- @treturn string prefix
function Version:getPrefix()
    return self.prefix
end

--- value accessor
-- @treturn string value
function Version:getValue()
    return self.value
end

--- full version string (prefix + value); overrides `vimdaloo.lang.Object:toString()`
-- @treturn string
function Version:toString()
    return self:getPrefix() .. self:getValue()
end

return Version
