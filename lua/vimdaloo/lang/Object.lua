-- https://www.lua.org/pil/19.3.html
local function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0 -- iterator variable
    local iter = function() -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

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

        --- string representation
        -- @display toString
        -- @treturn string the string representation
        toString = function(self)
            local str = ''
            for key, val in pairsByKeys(self) do
                if key ~= 'class' and string.sub(key, 1, 1) ~= '_' then
                    if string.len(str) ~= 0 then
                        str = str .. ','
                    end
                    str = string.format('%s%s=%s', str, key, val)
                end
            end
            local classname = self.__getclass(self):getName()
            if string.len(str) == 0 then
                return string.format('%s', classname)
            else
                return string.format('%s(%s)', classname, str)
            end
        end,

        __tostring = function(self)
            return self:toString()
        end,
    },
}
