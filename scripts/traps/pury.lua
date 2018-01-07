local RPD = require "scripts/lib/commonClasses"
local trap = require "scripts/lib/trap"
return trap.init(function(cell, char, data)
   local hero = RPD.Dungeon.hero
   local belongings = hero.belongings
   local level = RPD.Dungeon.level
   local items = {}
   local notRemoveClass = data
   local function removeItemFromHero(item)
      if item and not string.match(tostring(item:getClass()),notRemoveClass) then
         item:removeItemFrom(hero)
      end
   end
   for _, slot in pairs(items) do
      local item = belongings[slot]
      removeItemFromHero(item)
   end
   local itemsToRemove = {}
   print(belongings.backpack.items)
   print(belongings.backpack.items:size())
   for i = 0, belongings.backpack.items:size()-1 do
      table.insert(itemsToRemove,belongings.backpack.items:get(i))
   end
   for _,item in pairs(itemsToRemove) do
      removeItemFromHero(item)
   end
end)