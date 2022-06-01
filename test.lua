-- local import = require('vimdaloo').import
--
-- local Object = import('vimdaloo.lang.Object')
-- local obj = Object()
-- print(obj)
--
-- local Version = import('vimdaloo.version.Version')
-- local ver = Version('1.2.3')
-- print(ver)
--
-- local SemanticVersion = import('vimdaloo.version.SemanticVersion')
-- local sem_ver = SemanticVersion('1.2.3')
-- print(sem_ver)
--
-- local LuaVersion = import('vimdaloo.version.LuaVersion')
-- local lua_ver = LuaVersion:instance()
-- print(lua_ver)
--
-- local LuaJITVersion = import('vimdaloo.version.LuaJITVersion')
-- local lua_jit_ver = LuaJITVersion:instance()
-- print(lua_jit_ver)
--
-- local NvimVersion = import('vimdaloo.version.NvimVersion')
-- local nvim_ver = NvimVersion:instance()
-- print(nvim_ver)
--
-- local VimdalooVersion = import('vimdaloo.version.VimdalooVersion')
-- local oo_ver = VimdalooVersion:instance()
-- print(oo_ver)

local version = require('vimdaloo.version')
print(version.lua())
print(version.luajit())
print(version.nvim())
print(version.vimdaloo())
