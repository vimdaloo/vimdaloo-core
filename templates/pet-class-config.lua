-- luarocks install runstache --local
-- runstache pet-class-config.lua Class.lua.mustache Pet.lua
-- vi Pet.lua
return {
    -- standard
    openbrace = '{',
    closebrace = '}',
    -- custom
    root = 'example',
    pkg = 'pets',
    class = 'Pet',
    desc = 'This is an example class for a pet.',
    super = {
        pkg = 'animals',
        class = 'Animal',
        props = {
            { type = 'string', var = 'name', desc = 'the pet name' },
            { comma = true, type = 'number', var = 'kills', desc = 'the number of kills' },
        },
    },
    subclasses = {
        { pkg = 'cats', class = 'Cat', comma = true },
        { pkg = 'dogs', class = 'Dog' },
    },
    props = {
        { comma = true, type = 'string', var = 'nickname', access = 'Nickname', desc = 'the nickname' },
        { comma = true, type = 'number', var = 'xlost', access = 'TimesLost', desc = 'the number of times lost' },
    },
}
