local oo = require('vimdaloo')
local SemanticVersion = oo.import('vimdaloo.version.SemanticVersion')

---
-- @class vimdaloo.version.VimdalooVersion
-- @display …version.VimdalooVersion
-- @inherits vimdaloo.version.SemanticVersion
local VimdalooVersion = oo.singleton(SemanticVersion:subclass('vimdaloo.version.VimdalooVersion'))

--- Description.
-- The [Vimdaloo](https://vimdaloo.io/) semantic version.
-- @section Description

--- API.
--- @section API

--- constructor
-- @display VimdalooVersion
-- @treturn vimdaloo.version.VimdalooVersion
function VimdalooVersion:initialize()
    SemanticVersion.initialize(self, oo._VERSION:gsub('Vimdaloo ', ''))
end

return VimdalooVersion
