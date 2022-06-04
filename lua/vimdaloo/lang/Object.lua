namespace 'vimdaloo.lang' {
    ----
    --- &nbsp;<br/>
    --- **Class Root**
    ---
    --- &nbsp; &nbsp; <code style="padding: 0.2em; font-family: 'Consolas', 'Deja Vu Sans Mono', 'Bitstream Vera Sans Mono', monospace; font-size: 0.95em; letter-spacing: 0.01em; background-color: #fbedc3;">vimdaloo.lang.Object</code>
    ---
    -- @class vimdaloo.lang.Object
    -- @display …lang.Object
    --
    -- &nbsp;<br/>
    -- **Subclasses**
    --
    -- @{vimdaloo.lang.Class|Class},
    -- @{vimdaloo.version.Version|Version}
    class 'Object' {

        --- Description.
        -- Base class for all objects
        -- @section Description

        --- API.
        --- @section API

        --- constructor
        -- @display Object
        -- @treturn vimdaloo.lang.Object
        new = function(self) --- @diagnostic disable-line:unused-local
        end,

        --- class getter
        -- @display getClass
        -- @treturn string the class
        getClass = function(self)
            if self.class == nil then
                -- import and instanciate lazily,
                -- otherwise we get a cross-dependency loop between Class and Object
                import 'vimdaloo.lang.Class'
                self.class = vimdaloo.lang.Class(self.__getclass(self):getName())
            end
            return self.class
        end,
    },
}
