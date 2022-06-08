if not vim then
    require('vimdaloo').setup()
end

local function test_version()
    require('vimdaloo.version').print()
end
test_version()

local function test_color()
    print(require('vimdaloo.color').web.color2)
    print(require('vimdaloo.color').x11.color2)
end
test_color()
