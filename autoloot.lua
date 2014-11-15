------------------------------------------------------------------------
-- Setting up the local scope so we can work in modules
------------------------------------------------------------------------
local _, Augmento = ...

local currentSlot

local ForceLoot = CreateFrame('Frame')
ForceLoot:Hide()
ForceLoot:SetScript('OnUpdate', function()
   ConfirmLootSlot(currentSlot)
   StaticPopup_Hide('LOOT_BIND')
end)

function Augmento.LOOT_BIND_CONFIRM(slot)
   if(GetNumGroupMembers() == 0 or IsFishingLoot()) then
      currentSlot = slot
      ForceLoot:Show()
   end
end

function Augmento.LOOT_SLOT_CLEARED(slot)
   if(currentSlot == slot) then
      ForceLoot:Hide()

      if(not IsModifiedClick('AUTOLOOTTOGGLE')) then
         local items = GetNumLootItems()
         if(items > 0) then
            for index = 1, items do
               LootSlot(index)
            end
         end
      end
   end
end

function Augmento.CONFIRM_LOOT_ROLL(id, type)
   if(type > 0) then
      ConfirmLootRoll(id, type)
   end
end

function Augmento.CONFIRM_DISENCHANT_ROLL(id, type)
   if(type > 0) then
      ConfirmLootRoll(id, type)
   end
end