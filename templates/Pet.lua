local import = require('vimdaloo').import
local Animal = import('example.animals.Animal')

---
-- @class example.pets.Pet
-- @display …pets.Pet
-- @inherits example.animals.Animal
--
-- **Subclasses**
--
-- @{example.cats.Cat|Cat}},
-- @{example.dogs.Dog|Dog}}
local Pet = Animal:subclass('example.pets.Pet')

--- Description.
-- This is an example class for a pet.
-- @section Description

--- API.
--- @section API

--- constructor
-- @display Pet
-- @tparam string name the pet name
-- @tparam number kills the number of kills
-- @tparam string nickname the nickname
-- @tparam number xlost the number of times lost
-- @treturn example.pets.Pet
function Pet:initialize(name, kills, nickname, xlost)
    Animal.initialize(self, name, kills)
    self.nickname = nickname
    self.xlost = xlost
end

--- nickname getter
-- @treturn string nickname the nickname
function Pet:getNickname()
    return self.nickname
end

--- nickname setter
-- @tparam string nickname the nickname
function Pet:setNickname(nickname)
    self.nickname = nickname
end

--- xlost getter
-- @treturn number xlost the number of times lost
function Pet:getTimesLost()
    return self.xlost
end

--- xlost setter
-- @tparam number xlost the number of times lost
function Pet:setTimesLost(xlost)
    self.xlost = xlost
end

return Pet
