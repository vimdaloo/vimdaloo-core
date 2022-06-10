local Color = import 'vimdaloo.color.Color'

--- The `vimdaloo.color` submodule.
--
-- @module vimdaloo.color
-- @see vimdaloo

--- Details.
-- Color model representations.
-- @section Details

--- API.
-- @section API

local M = {
    web = {},
    xorg = {},
    x11 = {},
}

--- Initializes the `color` submodule. By default called automatically by `vimdaloo.setup(config)`.
-- @display setup
-- @tparam table config optional custom user configuration
function M.setup(config) --- @diagnostic disable-line:unused-local (config)
    -- initialize lua-color
    local lua_color = require 'lua-color'
    lua_color.colorNames = require 'lua-color.colors.X11'
end

--- Initializes the `color` submodule. By default called automatically by `vimdaloo.setup(config)`.
-- @display setup
-- @tparam table config optional custom user configuration
function M.setup_save(config) --- @diagnostic disable-line:unused-local (config)
    -- initialize lua-color
    local lua_color = require 'lua-color'
    lua_color.colorNames = require 'lua-color.colors.X11'

    -- TODO: Move everything in this function from here down into their own palettes?
    local name2nums = require 'vimdaloo.color.name2nums'

    -- populate vimdaloo.color.xorg
    local rgb2names = {}
    local rgb2nums = {}
    for name, rgb in pairs(lua_color.colorNames) do
        if not rgb2names[rgb] then
            rgb2names[rgb] = { name }
        else
            table.insert(rgb2names[rgb], name)
        end
        local nums = name2nums[string.lower(name)]
        if nums ~= nil then
            rgb2nums[rgb] = nums
        end
    end
    for rgb, names in pairs(rgb2names) do
        local color = Color(rgb, names, rgb2nums[rgb])
        for _, name in pairs(names) do
            M.xorg[name] = color
        end
    end

    -- populate vimdaloo.color.x11
    M.x11['color0'] = M.xorg.black
    M.x11['color1'] = M.xorg.X11Maroon
    M.x11['color2'] = M.xorg.X11Green
    M.x11['color3'] = M.xorg.olive
    M.x11['color4'] = M.xorg.navy
    M.x11['color5'] = M.xorg.X11Purple
    M.x11['color6'] = M.xorg.teal
    M.x11['color7'] = M.xorg.silver
    M.x11['color8'] = M.xorg.X11Gray
    M.x11['color9'] = M.xorg.red
    M.x11['color10'] = M.xorg.green
    M.x11['color11'] = M.xorg.yellow
    M.x11['color12'] = M.xorg.blue
    M.x11['color13'] = M.xorg.magenta
    M.x11['color14'] = M.xorg.cyan
    M.x11['color15'] = M.xorg.white

    M.x11['black'] = M.xorg.black
    M.x11['maroon'] = M.xorg.X11Maroon
    M.x11['green'] = M.xorg.X11Green
    M.x11['olive'] = M.xorg.olive
    M.x11['navy'] = M.xorg.navy
    M.x11['purple'] = M.xorg.X11Purple
    M.x11['teal'] = M.xorg.teal
    M.x11['silver'] = M.xorg.silver
    M.x11['gray'] = M.xorg.X11Gray
    M.x11['grey'] = M.xorg.X11Grey
    M.x11['red'] = M.xorg.red
    M.x11['lime'] = M.xorg.green
    M.x11['yellow'] = M.xorg.yellow
    M.x11['blue'] = M.xorg.blue
    M.x11['magenta'] = M.xorg.magenta
    M.x11['fuchsia'] = M.xorg.magenta
    M.x11['cyan'] = M.xorg.cyan
    M.x11['aqua'] = M.xorg.cyan
    M.x11['white'] = M.xorg.white

    -- populate vimdaloo.color.web
    M.web['color0'] = M.xorg.black
    M.web['color1'] = M.xorg.WebMaroon
    M.web['color2'] = M.xorg.WebGreen
    M.web['color3'] = M.xorg.olive
    M.web['color4'] = M.xorg.navy
    M.web['color5'] = M.xorg.WebPurple
    M.web['color6'] = M.xorg.teal
    M.web['color7'] = M.xorg.silver
    M.web['color8'] = M.xorg.WebGray
    M.web['color9'] = M.xorg.red
    M.web['color10'] = M.xorg.lime
    M.web['color11'] = M.xorg.yellow
    M.web['color12'] = M.xorg.blue
    M.web['color13'] = M.xorg.fuchsia
    M.web['color14'] = M.xorg.aqua
    M.web['color15'] = M.xorg.white

    M.web['black'] = M.xorg.black
    M.web['maroon'] = M.xorg.WebMaroon
    M.web['green'] = M.xorg.WebGreen
    M.web['olive'] = M.xorg.olive
    M.web['navy'] = M.xorg.navy
    M.web['purple'] = M.xorg.WebPurple
    M.web['teal'] = M.xorg.teal
    M.web['silver'] = M.xorg.silver
    M.web['gray'] = M.xorg.WebGray
    M.web['grey'] = M.xorg.WebGrey
    M.web['red'] = M.xorg.red
    M.web['lime'] = M.xorg.lime
    M.web['yellow'] = M.xorg.yellow
    M.web['blue'] = M.xorg.blue
    M.web['fuchsia'] = M.xorg.fuchsia
    M.web['magenta'] = M.xorg.fuchsia
    M.web['aqua'] = M.xorg.aqua
    M.web['cyan'] = M.xorg.aqua
    M.web['white'] = M.xorg.white
end

return M
