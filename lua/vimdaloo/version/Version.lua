local import = require('vimdaloo').import
local Object = import('vimdaloo.lang.Object')

---
-- @class vimdaloo.version.Version
-- @inherits vimdaloo.lang.Object
--
-- @see vimdaloo.version.SemanticVersion
--
local Version = Object:subclass('vimdaloo.version.Version')

--- constructor
-- @display Version
-- @tparam string value
-- @treturn vimdaloo.version.Version
function Version:initialize(value)
    Object.initialize(self)
    self.value = value
end

--- value accessor
-- @treturn string value
function Version:getValue()
    return self.value
end

return Version
