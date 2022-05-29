local oo = require('vimdaloo')
local SemanticVersion = oo.import('vimdaloo.version.SemanticVersion')

---
-- @class vimdaloo.version.VimdalooVersion
-- @inherits vimdaloo.version.SemanticVersion
--
-- [https://vimdaloo.io/](https://vimdaloo.io/)
--
local VimdalooVersion = oo.singleton(SemanticVersion:subclass('vimdaloo.version.VimdalooVersion'))

--- constructor
-- @display VimdalooVersion
-- @treturn vimdaloo.version.VimdalooVersion
function VimdalooVersion:initialize()
    SemanticVersion.initialize(self, '0.0.1-1')
end

return VimdalooVersion
