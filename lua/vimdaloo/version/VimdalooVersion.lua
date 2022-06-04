local oo = require 'vimdaloo'

import 'vimdaloo.version.SemanticVersion'

namespace 'vimdaloo.version' {
    ---
    -- @class vimdaloo.version.VimdalooVersion
    -- @display …version.VimdalooVersion
    -- @inherits vimdaloo.version.SemanticVersion
    class 'VimdalooVersion',
    extends 'vimdaloo.version.SemanticVersion' {

        --- Description.
        -- The [Vimdaloo](https://vimdaloo.io/) semantic version, populated from `vimdaloo._VERSION`
        -- @section Description

        --- API.
        --- @section API

        --- constructor
        -- @display VimdalooVersion
        -- @treturn vimdaloo.version.VimdalooVersion
        new = function(self)
            local prefix = 'Vimdaloo '
            vimdaloo.version.SemanticVersion.new(self, prefix, oo._VERSION:gsub(prefix, ''))
        end,
    },
}
