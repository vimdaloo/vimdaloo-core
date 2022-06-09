local Object = import 'vimdaloo.lang.Object'

local lua_color = require 'lua-color'

local function calc(num, mul_amnt, rnd_amt)
    if mul_amnt ~= nil then
        num = num * mul_amnt
    end
    if rnd_amt ~= nil then
        if rnd_amt == 1 then
            num = math.floor(num + 0.5)
        else
            local div = 10 ^ 2
            num = math.floor(num * div + rnd_amt) / div
        end
    end
    return num
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

        --- provides the CMYK color values
        -- @display cmyk
        -- @tparam boolean exact
        -- @treturn table the CMYK color table
        cmyk = function(self, exact)
            local c, m, y, k = self._color:cmyk()
            return {
                c = exact and c or calc(c, 100, 1),
                m = exact and m or calc(m, 100, 1),
                y = exact and y or calc(y, 100, 1),
                k = exact and k or calc(k, 100, 1),
            }
        end,

        --- provides the HEX color value
        -- @display hex
        -- @tparam string format value (optional, defaults to '#FFFFFF')
        -- @treturn table the HEX color table
        hex = function(self, format)
            format = format or '#FFFFFF'
            return string.upper(self._color:tostring(format))
        end,

        --- provides the HSB color values
        -- @display hsb
        -- @tparam boolean exact (optional, defaults to false)
        -- @treturn table the HSB color table
        hsb = function(self, exact)
            local hsva = self:hsv(exact)
            return {
                h = hsva.h,
                s = hsva.s,
                b = hsva.v,
                a = hsva.a,
            }
        end,

        --- provides the HSL color values
        -- @display hsl
        -- @tparam boolean exact (optional, defaults to false)
        -- @treturn table the HSL color table
        hsl = function(self, exact)
            local h, s, l, a = self._color:hsla()
            return {
                h = exact and h or calc(h, 360, 0.5),
                s = exact and s or calc(s, 100, 0.5),
                l = exact and l or calc(l, 100, 0.5),
                a = a,
            }
        end,

        --- provides the HSV color values
        -- @display hsv
        -- @tparam boolean exact (optional, defaults to false)
        -- @treturn table the HSV color table
        hsv = function(self, exact)
            local h, s, v, a = self._color:hsva()
            return {
                h = exact and h or calc(h, 360, 0.5),
                s = exact and s or calc(s, 100, 0.5),
                v = exact and v or calc(v, 100, 0.5),
                a = a,
            }
        end,

        --- provides the HWB color values
        -- @display hwb
        -- @tparam boolean exact (optional, defaults to false)
        -- @treturn table the HWB color table
        hwb = function(self, exact)
            local h, w, b, a = self._color:hwba()
            return {
                h = exact and h or calc(h, 360, 0.5),
                w = exact and w or calc(w, 100, 0.5),
                b = exact and b or calc(b, 100, 0.5),
                a = a,
            }
        end,

        --- provides the NCol color representation
        -- @display ncol
        -- @tparam boolean exact
        -- @treturn string the NCol color representation
        ncol = function(self)
            return self._color:tostring 'ncol'
        end,

        --- provides the RGB color values
        -- @display rgb
        -- @tparam boolean exact (optional, defaults to false)
        -- @tparam boolean percent (optional, defaults to false)
        -- @treturn table the RGB color table
        rgb = function(self, exact, percent)
            local r, g, b, a = self._color:rgba()
            if exact then
                return {
                    r = percent and calc(r, 100, nil) or r,
                    g = percent and calc(g, 100, nil) or g,
                    b = percent and calc(b, 100, nil) or b,
                    a = a,
                }
            else
                return {
                    r = percent and calc(r, 100, 0.5) or calc(r, 255, nil),
                    g = percent and calc(g, 100, 0.5) or calc(g, 255, nil),
                    b = percent and calc(b, 100, 0.5) or calc(b, 255, nil),
                    a = a,
                }
            end
        end,

        --- full version string; overrides `vimdaloo.lang.Object:toString()`
        -- @display toString
        -- @tparam boolean exact (optional, defaults to false)
        -- @tparam boolean rgb_percent (optional defaults to false)
        -- @treturn string the string form
        toString = function(self, exact, rgb_percent)
            return Object.toString(self, {
                cmyk = self:cmyk(exact),
                hex = self:hex '#FFFFFFFF',
                hsb = self:hsb(exact),
                hsl = self:hsl(exact),
                hsv = self:hsv(exact),
                hwb = self:hwb(exact),
                ncol = self:ncol(),
                rgb = self:rgb(exact, rgb_percent),
            })
        end,
    },
}
