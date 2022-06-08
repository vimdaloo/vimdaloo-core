local Animal = import 'example.animals.Animal'

namespace 'example.pets' {
    ---
    -- @class example.pets.Pet
    -- @display …pets.Pet
    -- @inherits example.animals.Animal
    --
    -- **Subclasses**
    --
    -- @{example.cats.Cat|Cat},
    -- @{example.dogs.Dog|Dog}
    class 'Pet',
    extends 'example.animals.Animal' {

        --- Details.
        -- This is an example class for a pet.
        -- @section Details

        --- API.
        --- @section API

        --- constructor
        -- @display Pet
        -- @tparam string name the pet name
        -- @tparam number kills the number of kills
        -- @tparam string nickname the nickname
        -- @tparam number xlost the number of times lost
        -- @treturn example.pets.Pet
        new = function(self, name, kills, nickname, xlost)
            Animal.new(self, name, kills)
            self.nickname = nickname
            self.xlost = xlost
        end,

        --- nickname getter
        -- @display getNickname
        -- @treturn string nickname the nickname
        getNickname = function(self)
            return self.nickname
        end,

        --- nickname setter
        -- @display setNickname
        -- @tparam string nickname the nickname
        setNickname = function(self, nickname)
            self.nickname = nickname
        end,

        --- xlost getter
        -- @display getTimesLost
        -- @treturn number xlost the number of times lost
        getTimesLost = function(self)
            return self.xlost
        end,

        --- xlost setter
        -- @display setTimesLost
        -- @tparam number xlost the number of times lost
        setTimesLost = function(self, xlost)
            self.xlost = xlost
        end,
    },
}
