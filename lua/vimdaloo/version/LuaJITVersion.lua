local SemanticVersion = import 'vimdaloo.version.SemanticVersion'

namespace 'vimdaloo.version' {
    ---
    -- @class vimdaloo.version.LuaJITVersion
    -- @display …version.LuaJITVersion
    -- @inherits vimdaloo.version.SemanticVersion
    class 'LuaJITVersion',
    extends 'vimdaloo.version.SemanticVersion' {

        --- Details.
        -- The semantic version singleton populated from [`jit.version`](https://luajit.org/ext_jit.html)
        -- @section Details

        --- API.
        --- @section API

        --- singleton
        -- @display instance
        -- @treturn vimdaloo.version.LuaJITVersion
        singleton = function(self)
            assert(jit, 'unable to initialize LuaJITVersion: "jit" global variable missing')
            local prefix = 'LuaJIT '
            SemanticVersion.new(self, prefix, jit.version:gsub(prefix, ''))
        end,
    },
}
