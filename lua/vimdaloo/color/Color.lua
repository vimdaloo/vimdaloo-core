local Object = import 'vimdaloo.lang.Object'

local lua_color = require 'lua-color'

local function check(multiply)
    if multiply ~= nil then
        return multiply
    else
        local color = require 'vimdaloo.color'
        if color.config['multiply'] ~= nil then
            return color.config.multiply
        else
            return true
        end
    end
end

namespace 'vimdaloo.color' {
    ---
    -- @class vimdaloo.color.Color
    -- @display …color.Color
    -- @inherits vimdaloo.lang.Object
    class 'Color',
    extends 'vimdaloo.lang.Object' {

        --- Details.
        -- Represents a color.
        -- @section Details

        --- API.
        --- @section API

        --- constructor
        -- @display Color
        -- @tparam value value
        -- @tparam names names (optional)
        -- @treturn vimdaloo.color.Color
        new = function(self, value, names)
            Object.new(self, value)
            self._color = lua_color(value)
            self.names = names or {}
        end,

        --- names getter
        -- @display getNames
        -- @treturn table names the known color names
        getNames = function(self)
            return self.names
        end,

        --- HEX color value
        -- @display cmyk
        -- @tparam string format value (optional, defaults to '#FFFFFF')
        -- @treturn table the HEX color table
        hex = function(self, format)
            format = format or '#FFFFFF'
            return string.upper(self._color:tostring(format))
        end,

        --- provides the RGB color format
        -- @display rgb
        -- @tparam boolean multiply (optional, defaults to config or true)
        -- @treturn table the RGB color table
        rgb = function(self, multiply)
            local r, g, b = self._color:rgb()
            local m = check(multiply)
            return {
                r = m and (r * 255) or r,
                g = m and (g * 255) or g,
                b = m and (b * 255) or b,
            }
        end,

        --- provides the RGBA color format
        -- @display rgba
        -- @tparam boolean multiply (optional, defaults to config or true)
        -- @treturn table the RGBA color table
        rgba = function(self, multiply)
            local r, g, b, a = self._color:rgba()
            local m = check(multiply)
            return {
                r = m and (r * 255) or r,
                g = m and (g * 255) or g,
                b = m and (b * 255) or b,
                a = a,
            }
        end,

        --- provides the CMYK color format
        -- @display cmyk
        -- @treturn table the CMYK color table
        cmyk = function(self)
            local c, m, y, k = self._color:cmyk()
            return {
                c = c,
                m = m,
                y = y,
                k = k,
            }
        end,

        --- provides the HSL color format
        -- @display hsl
        -- @tparam boolean multiply (optional, defaults to config or true)
        -- @treturn table the HSL color table
        hsl = function(self, multiply)
            local h, s, l = self._color:hsl()
            local m = check(multiply)
            return {
                h = m and (h * 360) or h,
                s = m and (s * 100) or s,
                l = m and (l * 100) or l,
            }
        end,

        --- provides the HSLA color format
        -- @display hsla
        -- @tparam boolean multiply (optional, defaults to config or true)
        -- @treturn table the HSLA color table
        hsla = function(self, multiply)
            local h, s, l, a = self._color:hsla()
            local m = check(multiply)
            return {
                h = m and (h * 360) or h,
                s = m and (s * 100) or s,
                l = m and (l * 100) or l,
                a = a,
            }
        end,

        --- provides the HSV color format
        -- @display hsv
        -- @tparam boolean multiply (optional, defaults to config or true)
        -- @treturn table the HSV color table
        hsv = function(self, multiply)
            local h, s, v = self._color:hsv()
            local m = check(multiply)
            return {
                h = m and (h * 360) or h,
                s = m and (s * 100) or s,
                v = m and (v * 100) or v,
            }
        end,

        --- provides the HSVA color format
        -- @display hsva
        -- @tparam boolean multiply (optional, defaults to config or true)
        -- @treturn table the HSVA color table
        hsva = function(self, multiply)
            local h, s, v, a = self._color:hsva()
            local m = check(multiply)
            return {
                h = m and (h * 360) or h,
                s = m and (s * 100) or s,
                v = m and (v * 100) or v,
                a = a,
            }
        end,

        --- provides the HWB color format
        -- @display hwb
        -- @tparam boolean multiply (optional, defaults to config or true)
        -- @treturn table the HWB color table
        hwb = function(self, multiply)
            local h, w, b = self._color:hwb()
            local m = check(multiply)
            return {
                h = m and (h * 360) or h,
                w = m and (w * 100) or w,
                b = m and (b * 100) or b,
            }
        end,

        --- provides the HWBA color format
        -- @display hwba
        -- @tparam boolean multiply (optional, defaults to config or true)
        -- @treturn table the HWBA color table
        hwba = function(self, multiply)
            local h, w, b, a = self._color:hwba()
            local m = check(multiply)
            return {
                h = m and (h * 360) or h,
                w = m and (w * 100) or w,
                b = m and (b * 100) or b,
                a = a,
            }
        end,

        --- NCol color representation
        -- @display ncol
        -- @treturn string the NCol color representation
        ncol = function(self)
            return self._color:tostring 'ncol'
        end,

        --- full version string; overrides `vimdaloo.lang.Object:toString()`
        -- @display toString
        -- @treturn string the string form
        toString = function(self)
            return Object.toString(self, {
                hex = self:hex(),
                rgb = self:rgb(),
            })
        end,
    },
}
